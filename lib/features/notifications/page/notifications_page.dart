import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/loader_view.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/svg_images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/empty_widget.dart';
import '../../../data/config/di.dart';
import '../provider/notifications_provider.dart';
import '../widgets/notification_card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    Future.delayed(
        Duration.zero, () => sl<NotificationsProvider>().getNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("notifications", context),
        ),
        body: Column(
          children: [
            Expanded(child:
                Consumer<NotificationsProvider>(builder: (_, provider, child) {
              return provider.isLoading
                  ? const LoaderView()
                  : provider.model != null &&
                          provider.model?.data != null &&
                          provider.model!.data!.isNotEmpty
                      ? RefreshIndicator(
                          color: Styles.PRIMARY_COLOR,
                          onRefresh: () async {
                            sl<NotificationsProvider>().getNotifications();
                          },
                          child: Column(
                            children: [
                              ListAnimator(
                                  data: List.generate(
                                      provider.model?.data?.length ?? 0,
                                      (index) => Dismissible(
                                            background: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CustomButton(
                                                  width: 100.w,
                                                  height: 30.h,
                                                  text: getTranslated(
                                                      "delete", context),
                                                  svgIcon: SvgImages.cancel,
                                                  iconSize: 12,
                                                  iconColor: Styles.IN_ACTIVE,
                                                  textColor: Styles.IN_ACTIVE,
                                                  backgroundColor: Styles
                                                      .IN_ACTIVE
                                                      .withOpacity(0.12),
                                                ),
                                              ],
                                            ),
                                            key: ValueKey(index),
                                            confirmDismiss: (DismissDirection
                                                direction) async {
                                              provider.deleteNotification(
                                                  provider.model?.data?[index]
                                                          .id ??
                                                      0);
                                              return false;
                                            },
                                            child: NotificationCard(
                                              withBorder: index != 9,
                                              notification:
                                                  provider.model?.data?[index],
                                            ),
                                          ))),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          color: Styles.PRIMARY_COLOR,
                          onRefresh: () async {
                            sl<NotificationsProvider>().getNotifications();
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: ListAnimator(data: [
                                  EmptyState(
                                    txt: getTranslated(
                                        "there_are_no_notifications", context),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        );
            }))
          ],
        ),
      ),
    );
  }
}

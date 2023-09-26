import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/empty_widget.dart';
import '../provider/config_provider.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.BACKGROUND_COLOR,
      body: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: getTranslated("terms_conditions", context)),
              Consumer<ConfigProvider>(builder: (_, provider, child) {
                return !provider.isLoading
                    ? Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                            vertical: Dimensions.PADDING_SIZE_SMALL.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                            vertical: Dimensions.PADDING_SIZE_SMALL.h,
                          ),
                          decoration: BoxDecoration(
                              color: Styles.WHITE,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListAnimator(
                            data: [
                              Text(getTranslated("terms_description", context),
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.w700.copyWith(
                                      fontSize: 22,
                                      color: Styles.PRIMARY_COLOR)),
                              SizedBox(
                                height: 24.h,
                              ),
                              provider.setting != null
                                  ? HtmlWidget(provider.setting?.terms ?? "")
                                  : EmptyState(
                                      txt: getTranslated(
                                          "something_went_wrong", context),
                                    )
                            ],
                          ),
                        ),
                      )
                    : const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Styles.PRIMARY_COLOR,
                          ),
                        ),
                      );
              }),
            ],
          )),
    );
  }
}

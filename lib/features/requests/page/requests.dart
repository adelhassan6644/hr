import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/empty_widget.dart';
import 'package:yusrPlus/features/requests/provider/requests_provider.dart';
import 'package:yusrPlus/features/requests/widgets/request_card.dart';

import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/loader_view.dart';
import '../../../data/config/di.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests>
    with AutomaticKeepAliveClientMixin<Requests> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () => sl<RequestsProvider>().getRequests());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: CustomAppBar(title: getTranslated("requests", context)),
      body: Consumer<RequestsProvider>(builder: (_, provider, child) {
        return provider.isLoading
            ? const LoaderView()
            : RefreshIndicator(
                onRefresh: () async {
                  if (!provider.isLoading) {
                    await provider.getRequests();
                  }
                },
                color: Styles.PRIMARY_COLOR,
                child: Column(
                  children: [
                    Expanded(
                      child: ListAnimator(
                        customPadding: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                        data: [
                          !provider.isLoading && provider.requests.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Dimensions
                                              .PADDING_SIZE_DEFAULT.h),
                                      child: Text(
                                        "${provider.requests.length} ${getTranslated("results", context)}",
                                        style: AppTextStyles.w600.copyWith(
                                            fontSize: 12, color: Styles.HEADER),
                                      ),
                                    ),
                                    ...List.generate(
                                      provider.requests.length,
                                      (index) => RequestCard(
                                        request: provider.requests[index],
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(height: 80.h),
                                    Center(
                                      child: EmptyState(
                                        imgHeight: 200,
                                        imgWidth: 200,
                                        txt: getTranslated(
                                            "there_is_no_requests", context),
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(height: 80.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

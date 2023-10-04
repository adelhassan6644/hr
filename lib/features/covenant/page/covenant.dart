import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/images.dart';
import 'package:yusrPlus/components/empty_widget.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../components/loader_view.dart';
import '../../../data/config/di.dart';
import '../provider/covenant_provider.dart';
import '../widget/pledge_card.dart';

class Covenant extends StatefulWidget {
  const Covenant({Key? key}) : super(key: key);

  @override
  State<Covenant> createState() => _CovenantState();
}

class _CovenantState extends State<Covenant> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () => sl<CovenantProvider>().getCovenant());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            title: getTranslated("covenant", context),
          ),
          body: Consumer<CovenantProvider>(builder: (_, provider, child) {
            return provider.isLoading
                ? const LoaderView()
                : Column(
                    children: [
                      Expanded(
                          child: ListAnimator(
                        customPadding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
                            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                        data: (!provider.isLoading &&
                                provider.covenant.isNotEmpty)
                            ? List.generate(
                                provider.covenant.length,
                                (index) => PledgeCard(
                                      pledgeModel: provider.covenant[index],
                                    ))
                            : [
                                SizedBox(
                                  height: 80.h,
                                ),
                                EmptyState(
                                  img: Images.emptyAsset,
                                  txt: getTranslated(
                                      "there_is_no_covenant", context),
                                )
                              ],
                      ))
                    ],
                  );
          })),
    );
  }
}

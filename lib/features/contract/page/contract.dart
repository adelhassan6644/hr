import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/features/contract/provider/contract_provider.dart';
import 'package:yusrPlus/features/contract/widgets/contract_card.dart';

import '../../../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../components/empty_widget.dart';
import '../../../components/loader_view.dart';
import '../../../data/config/di.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({Key? key}) : super(key: key);

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  @override
  void initState() {
    sl<ContractProvider>().getContracts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            title: getTranslated("contracts", context),
          ),
          body: Consumer<ContractProvider>(builder: (_, provider, child) {
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
                                provider.contracts.isNotEmpty)
                            ? List.generate(
                                provider.contracts.length,
                                (index) => ContractCard(
                                      contractModel: provider.contracts[index],
                                    ))
                            : [
                                SizedBox(
                                  height: 80.h,
                                ),
                                EmptyState(
                                  img: Images.emptyAsset,
                                  txt: getTranslated(
                                      "there_is_no_contracts", context),
                                )
                              ],
                      ))
                    ],
                  );
          })),
    );
  }
}

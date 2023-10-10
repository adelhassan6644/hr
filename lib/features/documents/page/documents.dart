import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../main_providers/user_provider.dart';
import '../widget/document_file_card.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("documents", context),
      ),
      body: Consumer<UserProvider>(builder: (_, provider, child) {
        return Column(
          children: [
            Expanded(
              child: ListAnimator(
                customPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                data: [
                  /// The Personal Documents
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: CustomExpansionTile(
                        title: getTranslated("personal_documents", context),
                        children: [
                          DocumentFileCard(
                            title: getTranslated("personal_id", context),
                            url: provider.user?.employeeInfo?.idDocument,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          DocumentFileCard(
                            title: getTranslated("passport", context),
                            url: provider.user?.employeeInfo?.passportDocument,
                          ),
                        ]),
                  ),

                  /// The Employee  Documents
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: CustomExpansionTile(
                        title: getTranslated("employee_documents", context),
                        children: [
                          DocumentFileCard(
                            title: getTranslated("employee_file", context),
                            url: provider.user?.applicationDocument,
                          )
                        ]),
                  ),

                  /// The Company  Documents
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: CustomExpansionTile(
                        title: getTranslated("company_documents", context),
                        children: [
                          DocumentFileCard(
                            title: getTranslated("company_file", context),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

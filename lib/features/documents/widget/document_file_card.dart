import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';
import '../../../main_providers/download_provider.dart';

class DocumentFileCard extends StatelessWidget {
  const DocumentFileCard({super.key, required this.title, this.url});
  final String title;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showToast(getTranslated("not_supported_yet", context)),
      child: ChangeNotifierProvider(
        create: (_) => DownloadProvider(),
        child:
            Consumer<DownloadProvider>(builder: (_, downloadProvider, child) {
          return CustomButton(
              textColor: Styles.PRIMARY_COLOR,
              text: title,
              onTap: () async {
                if (!downloadProvider.downloaded) {
                  downloadProvider.download(
                      url ?? "", url ?? "".split("/").last);
                }
              },
              isLoading: downloadProvider.isLoading,
              lIconWidget: const Icon(
                Icons.download,
                color: Styles.PRIMARY_COLOR,
              ),
              backgroundColor: Styles.WHITE);
        }),
      ),
    );
  }
}

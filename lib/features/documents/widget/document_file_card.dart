import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/data/api/end_points.dart';
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
    return ChangeNotifierProvider(
      create: (_) => DownloadProvider(),
      child:
          Consumer<DownloadProvider>(builder: (_, downloadProvider, child) {
        return CustomButton(
          text: title,
          onTap: () async {

            if (url==
                null) {
              showToast(getTranslated(
                  "notـreleased", context));
              return;
            }
            if (!downloadProvider.downloaded) {

              downloadProvider.download(EndPoints.imageUrl + url! ,  (url ?? "".split("/").last));
            }
          },
          isLoading: downloadProvider.isLoading,
          lIconWidget: const Icon(
            Icons.download,
            color: Styles.WHITE,
          ),
        );
      }),
    );
  }
}

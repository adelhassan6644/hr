import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../app/core/app_snack_bar.dart';
import '../app/core/color_resources.dart';
import '../app/core/svg_images.dart';
import '../app/core/text_styles.dart';
import '../app/localization/language_constant.dart';
import '../data/api/end_points.dart';
import '../main_providers/download_provider.dart';
import 'custom_images.dart';

class DownLoadAttachments extends StatelessWidget {
  const DownLoadAttachments({super.key, this.attachments});
  final List<String>? attachments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated("attachments", context),
          style: AppTextStyles.w600
              .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 16),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: const Color(0xffF2F9FD),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: [
            SizedBox(
              height: 12.h,
            ),
            ...List.generate(
                attachments?.length ?? 0,
                (index) => Column(
                      children: [
                        ChangeNotifierProvider(
                          create: (_) => DownloadProvider(),
                          child: Consumer<DownloadProvider>(
                              builder: (_, downloadProvider, child) {
                            return Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                      color: Styles.WHITE,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: customImageIconSVG(
                                    imageName: SvgImages.documentFile,
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Expanded(
                                    child: Text(
                                  attachments?[index].split("/").last ?? "",
                                  maxLines: 2,
                                  style: AppTextStyles.w700.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      color: Styles.HEADER,
                                      fontSize: 12),
                                )),
                                SizedBox(
                                  width: 12.w,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (!downloadProvider.downloaded &&
                                        !downloadProvider.isLoading) {
                                      downloadProvider.download(
                                          "${EndPoints.imageUrl}${attachments?[index] ?? ""}",
                                          (attachments?[index]
                                                  .split("/")
                                                  .last ??
                                              ""),
                                          withDialog: false);
                                    }
                                  },
                                  child: downloadProvider.isLoading
                                      ? const CupertinoActivityIndicator()
                                      : Icon(
                                          downloadProvider.downloaded
                                              ? Icons.download_done
                                              : Icons.download,
                                          color: downloadProvider.downloaded
                                              ? Colors.green
                                              : Styles.PRIMARY_COLOR,
                                          size: 20,
                                        ),
                                ),
                              ],
                            );
                          }),
                        ),
                        Visibility(
                            visible: index != attachments!.length - 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: const Divider(
                                  color: Color(0xFFEBF1F4), thickness: 1.0),
                            )),
                        Visibility(
                          visible: index == attachments!.length - 1,
                          child: SizedBox(
                            height: 12.h,
                          ),
                        ),
                      ],
                    ))
          ]),
        ),
      ],
    );
  }
}

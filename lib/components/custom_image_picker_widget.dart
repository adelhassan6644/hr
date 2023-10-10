import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../app/core/color_resources.dart';
import '../app/core/svg_images.dart';
import '../app/core/text_styles.dart';
import '../app/localization/language_constant.dart';
import '../data/api/end_points.dart';
import 'custom_images.dart';
import 'image_pop_up_viewer.dart';
import 'marquee_widget.dart';

class CustomButtonImagePicker extends StatelessWidget {
  const CustomButtonImagePicker({
    Key? key,
    this.imageFile,
    this.imageUrl,
    this.canEdit = true,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final File? imageFile;
  final String? imageUrl;
  final String title;
  final void Function() onTap;
  final bool canEdit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imageFile == null && imageUrl == null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Styles.LIGHT_BORDER_COLOR, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Expanded(
                    child: MarqueeWidget(
                      child: Text(
                        title,
                        style: AppTextStyles.w400.copyWith(
                            color: Styles.disabledColor,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  customImageIconSVG(imageName: SvgImages.pic)
                ],
              ),
            ),
          ),
        if (imageFile != null || imageUrl != null)
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Styles.LIGHT_BORDER_COLOR, width: 1),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () => Future.delayed(
                        Duration.zero,
                        () => showDialog(
                            context: context,
                            barrierColor: Colors.black.withOpacity(0.75),
                            builder: (context) {
                              return ImagePopUpViewer(
                                image: imageFile ?? imageUrl,
                                isFromInternet:
                                    imageFile != null ? false : true,
                                title: "",
                              );
                            })),
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: imageFile != null
                            ? Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: EndPoints.imageUrl + imageUrl!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                Visibility(visible: canEdit, child: SizedBox(width: 10.w)),
                Visibility(
                  visible: canEdit,
                  child: Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Text(getTranslated("edit", context),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.w400.copyWith(
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.blueAccent)),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

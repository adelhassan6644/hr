import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/api/end_points.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';
import 'package:hr_project/domain/localization/language_constant.dart';

import '../../app/core/utils/images.dart';
import 'image_viewer.dart';


class CustomButtonImagePicker extends StatelessWidget {
  const CustomButtonImagePicker({
    Key? key,
    required this.title,
    this.imageFile,
    this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final File? imageFile;
  final String? imageUrl;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                      color: ColorResources.BACKGROUND_COLOR,
                      border: Border.all(
                      style: BorderStyle.solid,
                      color: ColorResources.GOLD_COLOR.withOpacity(0.2),
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 15.w),
                      imageFile != null || imageUrl != null ?
                      const Icon(Icons.file_upload,
                          size: 20,
                        color: ColorResources.GOLD_COLOR,
                      ) : Image.asset(
                        Images.attachment,
                        height: 20,
                        color: ColorResources.GOLD_COLOR,
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        imageFile != null || imageUrl != null ? getTranslated("edit", context) : getTranslated( "attachment", context),
                        style: AppTextStyles.w500.copyWith(
                            fontSize: 12,
                            color: ColorResources.PRIMARY),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (imageFile != null || imageUrl != null) ...[
               SizedBox(width: 10.w),
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageViewer(image:imageFile ?? imageUrl,
                            isFromInternet:imageFile != null ? false: true,
                       ),
                      ),
                    );
                  },
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.w),
                      child: imageFile != null ? Image.file(File(imageFile!.path ), fit: BoxFit.cover,):
                      CachedNetworkImage( imageUrl:EndPoints.baseUrl.replaceAll("api", "")+imageUrl!,fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

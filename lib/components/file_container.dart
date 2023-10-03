import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../app/core/color_resources.dart';
import '../app/core/svg_images.dart';
import '../app/core/text_styles.dart';
import '../helpers/file_picker_helper.dart';
import 'custom_images.dart';

class FileContainer extends StatelessWidget {
  const FileContainer({Key? key, this.attachments,required this.onRemove})
      : super(key: key);
  final List<File>? attachments;
  final Function(List<File>?) onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Row(
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
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FilePickerHelper.getName(
                                  attachments![index].path),
                              style: AppTextStyles.w700
                                  .copyWith(color: Styles.HEADER, fontSize: 12),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            FutureBuilder(
                              future: FilePickerHelper.getFileSize(
                                  attachments![index], 1),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                return Text(
                                  snapshot.hasData ? "${snapshot.data}" : "",
                                  style: AppTextStyles.w700.copyWith(
                                      color: Styles.HEADER.withOpacity(0.4),
                                      fontSize: 10),
                                );
                              },
                            )
                          ],
                        )),
                        customImageIconSVG(
                            imageName: SvgImages.trash,
                            height: 20,
                            width: 20,
                            onTap: () {
                              attachments!.removeAt(index);
                              onRemove(attachments);
                            }),
                      ],
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
    );
  }
}

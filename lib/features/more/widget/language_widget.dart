import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import '../../../domain/localization/language_constant.dart';
import '../../notifier/language_provider.dart';

Widget languageWidget(
    {required BuildContext context,
      required LanguageModel languageModel,
      required LanguageProvider languageProvider,
      required int index}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: InkWell(
      onTap: () {
        languageProvider.setSelectIndex(index);
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        decoration: BoxDecoration(
          color: languageProvider.selectIndex == index
              ? ColorResources.PRIMARY.withOpacity(.15)
              : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  getTranslated(languageModel.languageName!, context),
                  style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorResources.blackColor
                  ),)
              ],
            ),
            languageProvider.selectIndex == index
                ? const Icon(Icons.done, color: ColorResources.PRIMARY)
                : const SizedBox.shrink()
          ],
        ),
      ),
    ),
  );
}
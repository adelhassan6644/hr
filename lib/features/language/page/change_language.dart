import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/features/more/widget/language_widget.dart';
import 'package:provider/provider.dart';
import '../../../app/core/app_storage_keys.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../app/localization/provider/localization_provider.dart';
import '../../../components/custom_button.dart';
import '../provider/language_provider.dart';


class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height*0.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),

          ),
        ),
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){ Navigator.pop(context);},
                    icon: const Icon(Icons.clear,size: 25,color: Styles.PRIMARY_COLOR,))
              ],),
            const SizedBox(height: 10),
            Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) => Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                              itemCount: languageProvider.languages.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => languageWidget(
                                  context: context,
                                  languageProvider:languageProvider,
                                  languageModel:
                                  languageProvider.languages[index],
                                  index: index)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal:40),
                          child: CustomButton(
                            height: 55,
                            text: getTranslated("save", context),
                            onTap: () {
                              Navigator.pop(context);
                              Provider.of<LocalizationProvider>(context,
                                  listen: false)
                                  .setLanguage(Locale(
                                AppStorageKey
                                    .languages[languageProvider.selectIndex]
                                    .languageCode!,
                                AppStorageKey
                                    .languages[languageProvider.selectIndex]
                                    .countryCode,
                              ));
                            }, textColor: Colors.white,
                            backgroundColor: Styles.PRIMARY_COLOR,
                          ),
                        ),
                      ],
                    ))),
            const SizedBox(height: 20),

          ],
        )
    );
  }
}

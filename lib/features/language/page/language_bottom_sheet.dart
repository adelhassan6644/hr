import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/localization/provider/localization_provider.dart';
import '../../../components/custom_radio_button.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<LocalizationProvider>(
          builder: (context, provider, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                provider.languages.length,
                (index) => CustomRadioButton(
                      title: provider.languages[index].name ?? "",
                      icon: provider.languages[index].icon,
                      check: provider.selectIndex == index,
                      onChange: (v) => provider.setSelectIndex(index),
                    )),
          ),
        ),
      ],
    );
  }
}

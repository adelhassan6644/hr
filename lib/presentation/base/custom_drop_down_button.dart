import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hr_project/app/core/utils/media_query_values.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<dynamic> items;
  final Widget? icon;
  final double iconSize;
  final String? label;
  final String name;
  final String? value;
  final void Function(Object?)? onChange;
  final String? Function(Object?)? validation;

  const CustomDropDownButton({
    required this.items,
     this.value,
     this.onChange,
    this.validation,
    this.icon,
    this.label,
    required this.name,
    this.iconSize = 14,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: FormBuilderDropdown(
        items: widget.items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: hintTextStyle,
            ),
          );
        }).toList(),
        onChanged: widget.onChange,
        initialValue: widget.value,
        isDense: true,
        validator: widget.validation,
        isExpanded: true,
        dropdownColor: ColorResources.fillColor,
        itemHeight: 50,
        icon: widget.icon ?? const Icon(Icons.arrow_drop_down),
        iconSize: widget.iconSize,
        hint: Text(
          widget.name,
          style: hintTextStyle,
        ),
        borderRadius:  const BorderRadius.all(
            Radius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
        decoration: InputDecoration(
          fillColor: ColorResources.fillColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 22, horizontal: 24),
          enabledBorder: disableBorderStyle,
          border: disableBorderStyle,
          focusedBorder: focusBorderStyle,
          disabledBorder: disableBorderStyle,
          errorBorder: errorOutLineInputBorderStyle,
          focusedErrorBorder: errorOutLineInputBorderStyle,
          labelText: widget.label,
          errorStyle: errorHintTextStyle,
        ),
        name: widget.name,
      ),
    );
  }
}

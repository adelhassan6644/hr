import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<dynamic> items;
  final Widget? icon;
  final String? pIcon;
  final Color? pIconColor;
  final double iconSize;
  final String? label;
  final String name;
  final String? value;
  final void Function(Object?)? onChange;
  final String? Function(Object?)? validation;

  const CustomDropDownButton({
    required this.items,
    this.value,
    this.pIcon,
    this.pIconColor,
    this.onChange,
    this.validation,
    this.icon,
    this.label,
    required this.name,
    this.iconSize = 25,
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
        dropdownColor: ColorResources.FILL,
        itemHeight: 50,
        icon: widget.icon ?? const Icon(Icons.arrow_drop_down,color:ColorResources.hintColor,),
        iconSize: widget.iconSize,
        hint: Row(
          children: [
            if( widget.pIcon != null )  Image.asset(
              widget.pIcon!,
              height: 20.w,
              width: 20.w,
              color: widget.pIconColor,
            ),
            SizedBox(width: 15.w,),
            Text(
              widget.name,
              style: hintTextStyle,
            ),
          ],
        ),
        borderRadius:   BorderRadius.all(
            Radius.circular(12.w)),
        decoration: InputDecoration(
          fillColor: ColorResources.FILL,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
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
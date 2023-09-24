import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../app/core/color_resources.dart';
import '../app/core/dimensions.dart';
import '../app/core/text_styles.dart';
import 'custom_images.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> items;
  final Widget? icon;
  final String? pAssetIcon;
  final String? pSvgIcon;
  final Color? pIconColor;
  final double iconSize;
  final String? label;
  final String name;
  final Object? value;
  final dynamic dataType;

  final void Function(Object?)? onChange;
  final String? Function(Object?)? validation;

  const CustomDropDownButton({
    required this.items,
    this.value,
    this.pAssetIcon,
    this.pSvgIcon,
    this.pIconColor,
    this.onChange,
    this.validation,
    this.icon,
    this.label,
    this.dataType,
    required this.name,
    this.iconSize = 22,
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
      height: 40,
      child: FormBuilderDropdown(
        items: widget.items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: AppTextStyles.w600
                  .copyWith(color: ColorResources.TITLE, fontSize: 13),
            ),
          );
        }).toList(),
        onChanged: widget.onChange,
        menuMaxHeight: context.height * 0.4,
        initialValue: widget.value,
        isDense: true,
        validator: widget.validation,
        isExpanded: true,
        dropdownColor: ColorResources.FILL_COLOR,
        itemHeight: 50,
        icon: widget.icon ??
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: ColorResources.PRIMARY,
            ),
        iconSize: widget.iconSize,
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.RADIUS_DEFAULT)),
        decoration: InputDecoration(
          hintStyle: AppTextStyles.w400
              .copyWith(color: ColorResources.disabledColor, fontSize: 14),
          hintText: widget.name,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            child: widget.pAssetIcon != null
                ? Image.asset(
                    widget.pAssetIcon!,
                    height: 20.h,
                    width: 20.w,
                    color: widget.pIconColor ?? Colors.black,
                  )
                : widget.pSvgIcon != null
                    ? customImageIconSVG(
                        imageName: widget.pSvgIcon!,
                        color: widget.pIconColor ?? Colors.black,
                        height: 20.h,
                      )
                    : null,
          ),
          fillColor: ColorResources.FILL_COLOR,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.RADIUS_DEFAULT,
              ),
            ),
            borderSide: BorderSide(
                color: ColorResources.LIGHT_BORDER_COLOR,
                width: 1,
                style: BorderStyle.solid),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.RADIUS_DEFAULT,
              ),
            ),
            borderSide: BorderSide(
                color: ColorResources.PRIMARY,
                width: 1,
                style: BorderStyle.solid),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.RADIUS_DEFAULT,
              ),
            ),
            borderSide: BorderSide(
                color: ColorResources.LIGHT_BORDER_COLOR,
                width: 1,
                style: BorderStyle.solid),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.RADIUS_DEFAULT,
              ),
            ),
            borderSide: BorderSide(
                color: ColorResources.LIGHT_BORDER_COLOR,
                width: 1,
                style: BorderStyle.solid),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.RADIUS_DEFAULT,
              ),
            ),
            borderSide: BorderSide(
                color: ColorResources.IN_ACTIVE,
                width: 1,
                style: BorderStyle.solid),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions.RADIUS_DEFAULT,
              ),
            ),
            borderSide: BorderSide(
                color: ColorResources.IN_ACTIVE,
                width: 1,
                style: BorderStyle.solid),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20.h,
          ),
          labelText: widget.label,
          errorStyle: AppTextStyles.w600
              .copyWith(color: ColorResources.IN_ACTIVE, fontSize: 11),
          labelStyle: AppTextStyles.w400
              .copyWith(color: ColorResources.disabledColor, fontSize: 14),
        ),
        style: AppTextStyles.w600
            .copyWith(color: ColorResources.PRIMARY, fontSize: 14),
        name: widget.name,
        elevation: 1,
      ),
    );
  }
}

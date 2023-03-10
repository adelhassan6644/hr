import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/images.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hint;
  final Widget? sufWidget;
  final bool label;
  final TextInputType? type;
  final Function(String?)? onSave;
  final String? Function(String?)? valid;
  final AutovalidateMode? validationMode;
  final IconData? icon;
  final IconData? eIcon;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final String? sIcon;
  final String? tIcon;
  final Color? tIconColor;
  final FocusNode? focus;
  final bool? read;
  final bool? flag;
  final bool? removePIcon;
  final VoidCallback? edit;
  final bool? isEdit;

  final List<TextInputFormatter>? formatter;
  final double? hor;
  final int? maxLength;
  final Color? fieldColor;
  final int? maxLine;
  final bool isValidat;

  const CustomTextFormField({
    super.key,
    this.isValidat = true,
    this.maxLine = 1,
    this.hint,
    this.sufWidget,
    this.onSave,
    this.onTap,
    this.onChanged,
    this.icon,
    this.type,
    this.valid,
    this.controller,
    this.focus,
    this.sIcon,
    this.label = false,
    this.read,
    this.eIcon,
    this.edit,
    this.isEdit,
    this.removePIcon = true,
    this.flag,
    this.hor,
    this.validationMode,
    this.formatter,
    this.maxLength,
    this.tIcon,
    this.tIconColor,
    this.fieldColor,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isHidden = true;

  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: widget.isValidat ? [] : [const ShakeEffect()],
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.valid,
        controller: widget.controller,
        maxLength: widget.maxLength,
        focusNode: widget.focus,
        readOnly: widget.read == true ? true : false,
        maxLines: widget.maxLine,
        obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
        keyboardType: widget.type,
        inputFormatters: widget.formatter ?? [],
        onSaved: (widget.onSave),
        style: !widget.isValidat
            ? hintTextStyle.copyWith(color: ColorResources.WARNING_COLOR)
            : hintTextStyle,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: widget.removePIcon == true
              ? null
              : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            child: widget.tIcon != null
                ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Image.asset(
                widget.tIcon!,
                height: 25.h,
                color: widget.tIconColor??ColorResources.disabledColor,
              ),
            )
                : null,
          ),
          suffixIcon: widget.removePIcon == true
              ? null : widget.icon == Icons.lock_outline
              ? IconButton(
            splashColor: Colors.transparent,
            onPressed: _visibility,
            alignment: Alignment.center,
            icon: _isHidden
                ?
            Image.asset(
                Images.eyeLockIcon,
                height: 25.h,
                color: ColorResources.disabledColor
            )
                : Image.asset(
              Images.unlockEyeLockIcon,
              color: ColorResources.PRIMARY,
              height: 25.h,
            ),
          )
              : widget.sufWidget != null
              ? Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 25.w, horizontal: 25.w),
              child: widget.sufWidget)
              : Icon(
            widget.icon,
            color: Colors.grey,
            size: 20,
          ),
          focusedBorder:
          widget.read == true ? disableBorderStyle : focusBorderStyle,
          enabledBorder: disableBorderStyle,
          disabledBorder: disableBorderStyle,
          focusedErrorBorder: errorOutLineInputBorderStyle,
          errorBorder: errorOutLineInputBorderStyle,
          contentPadding: EdgeInsets.symmetric(
              vertical: 25.w, horizontal: widget.sufWidget != null ? 0 : 25.h),
          border: disableBorderStyle,
          isDense: true,
          alignLabelWithHint: true,
          hintText: widget.hint,
          hintStyle: widget.isValidat ? hintTextStyle : errorHintTextStyle,
          labelText: widget.label ? widget.hint : null,
          fillColor: ColorResources.FILL,
          floatingLabelStyle: widget.isValidat ? labelTextStyle : errorHintTextStyle,
          filled: true,
          errorStyle: errorHintTextStyle,
          prefixIconConstraints: BoxConstraints(maxHeight: 20.h),
        ),
      ),
    );
  }
}
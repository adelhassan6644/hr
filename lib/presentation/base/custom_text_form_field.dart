import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/images.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hint;
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
  final FocusNode? focus;
  final bool? read;
  final bool? flag;
  final bool? removePIcon;
  final VoidCallback? edit;
  final bool? isEdit;
  final bool isHeightSmall;
  final List<TextInputFormatter>? formatter;
  final double? hor;
  final int? maxLength;
  final Color? fieldColor;
  final int? maxLine;
  final bool? error;

  const CustomTextFormField({super.key,
    this.error=false,
    this.isHeightSmall=false,
    this.maxLine=1,
    this.hint,
    this.onSave,
    this.onTap,
    this.onChanged,
    this.icon,
    this.type,
    this.valid,
    this.controller,
    this.focus,
    this.sIcon,
    this.label=false,
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

    return TextFormField(
      onTap: widget.onTap,
      validator: widget.valid,
      controller: widget.controller,
      maxLength: widget.maxLength,
      focusNode: widget.focus,
      readOnly: widget.read == true ? true : false,
      maxLines: widget.maxLine,
      obscureText: widget.icon == Icons.lock_outline? _isHidden : false,
      keyboardType: widget.type,
      inputFormatters: widget.formatter ?? [],
      onSaved: (widget.onSave),
      style:hintTextStyle,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon:widget.removePIcon == true ? null:Padding(
          padding: const EdgeInsets.only(right: 1),
          child: widget.tIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Image.asset(
                    widget.tIcon!,
                    height: 25,
                  ),
                )
              : null,
        ),
        suffixIcon: widget.removePIcon == true ? null:widget.icon == Icons.lock_outline
            ? IconButton(
                splashColor: Colors.transparent,
                onPressed: _visibility,
                alignment: Alignment.center,
                icon: _isHidden
                    ? Image.asset(
                        Images.eyeLockIcon,
                        height: 25,
                      )
                    : Image.asset(
                        Images.unlockEyeLockIcon,
                        color: ColorResources.primary,
                        height: 25,
                      ),
              )
            : Icon(
                widget.icon,
                color: Colors.grey,
                size: 20,
              ),
        focusedBorder: outLineInputBorderStyle,
        enabledBorder: outLineInputBorderStyle,
        disabledBorder: outLineInputBorderStyle,
        focusedErrorBorder: errorOutLineInputBorderStyle,
        errorBorder: errorOutLineInputBorderStyle,
        contentPadding:!widget.isHeightSmall? const EdgeInsets.symmetric(vertical: 28, horizontal: 24):
        const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        border: outLineInputBorderStyle,
        isDense: true,
        alignLabelWithHint: true,
        hintText: widget.hint,
        hintStyle: widget.error!?errorHintTextStyle: hintTextStyle,
        // labelText: widget.label? widget.hint : null,
        fillColor: ColorResources.fillColor,
        // labelStyle: widget.error!?errorHintPoppinsTextStyle: hintPoppinsTextStyle,
        filled: true,
        // errorText: "${widget.hint}*",
        errorStyle:errorHintTextStyle,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, maxHeight: 20),

      ),

    );
  }
}

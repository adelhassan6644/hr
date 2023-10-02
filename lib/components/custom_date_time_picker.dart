import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../app/core/images.dart';
import '../../navigation/custom_navigation.dart';
import '../app/localization/language_constant.dart';
import '../helpers/date_time_picker.dart';

class CustomSelectDate extends StatefulWidget {
  final String? format;
  final bool? isNotEmptyValue;
  final bool? showOnly;
  final DateTime? startDateTime;
  final ValueChanged<DateTime>? valueChanged;
  final String label;

  const CustomSelectDate(
      {Key? key,
      this.format,
      required this.valueChanged,
      this.isNotEmptyValue = false,
      this.showOnly = false,
      this.startDateTime,
      required this.label})
      : super(key: key);

  @override
  State<CustomSelectDate> createState() => _CustomSelectDateState();
}

class _CustomSelectDateState extends State<CustomSelectDate> {
  String _date = "";
  DateTime? date;

  @override
  void initState() {
    _date = widget.label;
    if (widget.isNotEmptyValue!) {
      date = widget.startDateTime;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder borders = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: Styles.PRIMARY_COLOR,
        width: 1,
      ),
    );

    return TextFormField(
      readOnly: true,
      onTap: () async {
        if (!widget.showOnly!) {
          showMaterialModalBottomSheet(
              enableDrag: true,
              clipBehavior: Clip.antiAlias,
              backgroundColor: Colors.transparent,
              context: CustomNavigator.navigatorState.currentContext!,
              expand: false,
              useRootNavigator: true,
              isDismissible: true,
              builder: (_) {
                return Padding(
                  padding: MediaQuery.of(
                          CustomNavigator.navigatorState.currentContext!)
                      .viewInsets,
                  child: DateTimePicker(
                      valueChanged: widget.valueChanged, label: widget.label),
                );
              });
        }
        FocusScope.of(context).requestFocus(FocusNode());
      },
      validator: (value) {
        if (value == null || value.isEmpty && _date == widget.label) {
          return "${getTranslated("select", context)} ${widget.label}";
        }
        return null;
      },
      controller: TextEditingController(
          text: widget.startDateTime?.format("dd / MM / yyyy")),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        hintText: _date,
        enabledBorder: borders.copyWith(
            borderSide: const BorderSide(color: Styles.BORDER_COLOR)),
        disabledBorder: borders.copyWith(
            borderSide: const BorderSide(color: Styles.BORDER_COLOR)),
        focusedBorder: borders.copyWith(
            borderSide: const BorderSide(color: Styles.PRIMARY_COLOR)),
        errorBorder: borders.copyWith(
            borderSide: const BorderSide(color: Styles.IN_ACTIVE)),
        border: borders.copyWith(
            borderSide: const BorderSide(color: Styles.BORDER_COLOR)),
        alignLabelWithHint: true,
        filled: true,
        fillColor: Styles.FILL_COLOR,
        label: Text(
          widget.label,
          style: AppTextStyles.w600.copyWith(color: Styles.PRIMARY_COLOR),
        ),
        hintStyle: AppTextStyles.w500.copyWith(fontSize: 14),
        suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Image.asset(
              Images.calenderIcon,
              height: 20.h,
              width: 20.w,
              color: Styles.hintColor,
            )),
      ),
    );
  }
}

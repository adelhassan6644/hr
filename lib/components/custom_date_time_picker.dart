import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/app/core/text_styles.dart';
import 'package:intl/intl.dart' ;
import '../app/core/constant.dart';
import '../app/core/images.dart';
import '../../navigation/custom_navigation.dart';
import '../app/localization/localization/language_constant.dart';
import 'confirm_bottom_sheet.dart';


class CustomSelectDate extends StatefulWidget {
  final String? initialString;
  final String? format;
  final bool? isNotEmptyValue;
  final bool? showOnly;
  final DateTime? startDateTime;
  final ValueChanged<DateTime>? valueChanged;
  final String label;

  const CustomSelectDate(
      {Key? key,
      this.initialString,
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
    _date = widget.initialString ?? widget.label;
    if (widget.isNotEmptyValue!) {
      date = DateTime.parse(widget.initialString!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        if (!widget.showOnly!) {
          CustomBottomSheet.show(
              label: widget.label,
              height: 360.h,
              onConfirm: () {
                if (date != null) {
                  setState(() =>
                      _date = DateFormat(widget.format??"dd,MMM,yyyy").format(date!));
                  widget.valueChanged!(date!);
                  CustomNavigator.pop();
                } else {
                  setState(() => _date =
                      DateFormat(widget.format??"dd,MMM,yyyy").format(DateTime.now()));
                  widget.valueChanged!(DateTime.now());
                  CustomNavigator.pop();
                }
              },
              list: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (value) => date = value,
                  initialDateTime: date ?? widget.startDateTime ?? DateTime.now(),
                  minimumDate: widget.startDateTime != null ? DateTime(
                          widget.startDateTime!.year,
                          widget.startDateTime!.month,
                          widget.startDateTime!.day)
                      : DateTime(1900),
                  maximumDate: DateTime(2100)));
        }
        FocusScope.of(context).requestFocus(FocusNode());
      },
      validator: (value) {
        if (value == null || value.isEmpty && _date == widget.label) {
          return "${getTranslated("select", context)} ${widget.label}";
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(vertical: 22.w, horizontal: 22.w),
          hintText: _date,
          alignLabelWithHint: true,
          enabledBorder: disableBorderStyle,
          border: disableBorderStyle,
          hintStyle: AppTextStyles.w500.copyWith(
            fontSize: 14
          ),
          suffixIcon: Padding(
              padding:  EdgeInsets.symmetric( horizontal: 20.w),
              child: Image.asset(Images.calenderIcon,height: 20.h,width: 20.w,color: ColorResources.hintColor,)),),
    );
  }
}

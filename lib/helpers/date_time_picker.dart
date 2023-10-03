import 'package:flutter/cupertino.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../navigation/custom_navigation.dart';
import '../app/core/dimensions.dart';
import '../app/localization/language_constant.dart';
import '../components/custom_button.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime? initialValue;
  final String? format;
  final DateTime? minDateTime;
  final ValueChanged<DateTime>? valueChanged;
  final String label;
  final CupertinoDatePickerMode? mode;

  const DateTimePicker(
      {Key? key,
      this.mode,
      this.initialValue,
      this.minDateTime,
      this.format,
      required this.valueChanged,
      required this.label})
      : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? date;

  @override
  void initState() {
    setState(() {
      date = widget.initialValue ?? DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      decoration: const BoxDecoration(
          color: Styles.WHITE,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Container(
                height: 5.h,
                width: 36.w,
                decoration: BoxDecoration(
                    color: const Color(0xFF3C3C43).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(100)),
                child: const SizedBox(),
              ),
            ),
          ),
          Text(
            widget.label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 12, 24.0, 12.0),
                child: CupertinoDatePicker(
                    mode: widget.mode ?? CupertinoDatePickerMode.date,
                    onDateTimeChanged: (value) => date = value,
                    initialDateTime: date,
                    minimumDate: widget.minDateTime != null
                        ? DateTime(widget.minDateTime!.year,
                            widget.minDateTime!.month, widget.minDateTime!.day)
                        : DateTime(1900),
                    maximumDate: DateTime(2100))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            ),
            child: CustomButton(
              text: getTranslated('confirm', context),
              onTap: () {
                if (date != null) {
                  widget.valueChanged!(date!);
                  CustomNavigator.pop();
                } else {
                  widget.valueChanged!(widget.initialValue ?? DateTime.now());
                  CustomNavigator.pop();
                }
              },
              backgroundColor: Styles.PRIMARY_COLOR,
              textColor: Styles.WHITE,
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

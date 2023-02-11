import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key, this.timeBySecond = 60, this.onCount});
  final int timeBySecond;
  final Function? onCount;

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Timer _timer;
  int _count = 0;
  @override
  void initState() {
    countDown();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  countDown() {
    setState(() => _count = widget.timeBySecond);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_count != 0) {
        setState(() => --_count);
      } else {
        if (_timer.isActive) _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _count == 0
        ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't get the code ?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap: () {
                    countDown();
                    if (widget.onCount != null) {
                      widget.onCount!();
                    }
                  },
                  child: const Text(
                    "Resend code",
                    style: TextStyle(
                        color: ColorResources.PRIMARY,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Text("code expires in: ", style: AppTextStyles.w500),
              Text(format(Duration(seconds: _count)),
                  style: AppTextStyles.w500.copyWith(color: Colors.red)),
            ],
          );
  }

  String format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
}

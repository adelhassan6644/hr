import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../app/core/color_resources.dart';

class CustomSingleSelector extends StatefulWidget {
  const CustomSingleSelector({
    Key? key,
    required this.onConfirm,
    required this.list,
    this.initialValue,
  }) : super(key: key);
  final ValueChanged<dynamic> onConfirm;
  final List<dynamic> list;
  final dynamic initialValue;

  @override
  State<CustomSingleSelector> createState() => _CustomSingleSelectorState();
}

class _CustomSingleSelectorState extends State<CustomSingleSelector> {
  int? _selectedItem;
  @override
  void initState() {
    setState(() {
      _selectedItem = widget.initialValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.list.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() => _selectedItem = widget.list[index].id);
            widget.onConfirm(widget.list[index]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Container(
              width: context.width,
              height: 44.h,
              decoration: BoxDecoration(
                color: _selectedItem == widget.list[index].id
                    ? Styles.PRIMARY_COLOR.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _selectedItem == widget.list[index].id
                      ? Styles.PRIMARY_COLOR
                      : Styles.LIGHT_BORDER_COLOR,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.list[index].name ?? "",
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Styles.PRIMARY_COLOR,
                        ),
                      ),
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Styles.WHITE,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Styles.PRIMARY_COLOR,
                            width: 2,
                          ),
                        ),
                        child: _selectedItem == widget.list[index].id
                            ? Center(
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Styles.PRIMARY_COLOR,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              )
                            : Container())
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

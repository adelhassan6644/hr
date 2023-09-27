import 'package:flutter/material.dart';
import 'package:hr_project/features/request_details/widget/request_details_widget.dart';
import 'package:hr_project/navigation/custom_navigation.dart';

import '../../../app/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_tab_bar_2.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({Key? key, required this.model}) : super(key: key);
  final Model model;

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  int currentIndex = 0;

  final List<String> tabs = [
    getTranslated(
        "request_details", CustomNavigator.navigatorState.currentContext!),
    getTranslated(
        "workflow_comments", CustomNavigator.navigatorState.currentContext!)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
            "${widget.model.requestType} ${getTranslated("request", context)} ",
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(.1)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tabs.length,
                (index) => Expanded(
                  child: TabWidget(
                    expand: true,
                    title: tabs[index],
                    isSelected: index == currentIndex ? true : false,
                    onTab: () {
                      setState(() => currentIndex = index);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: currentIndex == 0
                  ? RequestDetailsWidget(
                      model: widget.model,
                    )
                  : const SizedBox()),
        ],
      ),
    );
  }
}

class Model {
  final String status;
  final String requestType;
  Model({required this.status, required this.requestType});
}

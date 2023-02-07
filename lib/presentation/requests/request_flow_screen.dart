import 'package:flutter/material.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/requests/request_details_screen.dart';

import '../base/custom_tab_bar_2.dart';

class RequestFlowScreen extends StatefulWidget {
   const RequestFlowScreen({Key? key ,required this.status,required this.requestType,}) : super(key: key);
  final String status;
   final String requestType;


   @override
  State<RequestFlowScreen> createState() => _RequestFlowScreenState();
}

class _RequestFlowScreenState extends State<RequestFlowScreen> {
  int currentIndex = 0;

  final List<String> tabs = [getTranslated("request_details", CustomNavigator.navigatorState.currentContext!),getTranslated("workflow_comments", CustomNavigator.navigatorState.currentContext!)];

  // List<Widget> contents = [ RequestDetailsScreen(status: status),SizedBox()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(
        title: "${getTranslated("request", context)} ${widget.requestType}",
        showLeading: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                    BorderSide(color: Colors.grey.withOpacity(.1)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tabs.length,
                    (index) => Expanded(
                  child: TabWidget(
                    expand: true,
                    title: tabs[index],
                    isSelected: index == currentIndex ? true : false,
                      onTab:  () {
                        setState(() => currentIndex = index);
                      },
                  ),
                ),
              ),
            ),
          ),
          Expanded(child:currentIndex ==0? RequestDetailsScreen(status: widget.status, requestType: widget.requestType,):SizedBox()),
        ],
      ),
    );
  }
}

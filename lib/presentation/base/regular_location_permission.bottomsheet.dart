import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_button.dart';


class RegularLocationPermissionDialog extends StatelessWidget {
  const RegularLocationPermissionDialog({ Key? key}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children:  [
          //title
         Text( "Location Permission"),
          Text(           "This app collects location data to enable system search for assignable order within your location and also allow customer track your location when delivering their order."
          ),



          CustomButton(
            text: "Next",
            onTap: () {
              // AppService().navigatorKey.currentContext.pop(true);
            },
          ),
          CustomButton(
            text: "Cancel",

            onTap: () {
              context.pop(false);
              // print("called here");
            },
          ),
        ],
      ) //.hTwoThird(context),
    );
  }
}

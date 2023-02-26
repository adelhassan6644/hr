import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../navigation/custom_navigation.dart';
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
            onTap: () async {
              CustomNavigator.pop();
              await openAppSettings();

            },
          ),
          CustomButton(
            text: "Cancel",

            onTap: () async {
              CustomNavigator.pop();
              await openAppSettings();
            },
          ),
        ],
      ) //.hTwoThird(context),
    );
  }
}

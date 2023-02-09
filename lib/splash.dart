import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'app/core/utils/color_resources.dart';
import 'app/core/utils/images.dart';
import 'navigation/routes.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(seconds: 5), () {
    CustomNavigator.push(Routes.LOGIN,replace: true);
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.PRIMARY,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding:  const EdgeInsets.symmetric(vertical: 70.0),
                child: Center(
                  child: RichText(
                    text: const TextSpan(text: "HR App",  style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorResources.WHITE)),
                  ),
                )),
            Expanded(
              child: Center(
                child:Image.asset(
                  Images.splash,
                  color: ColorResources.WHITE,
                  height: 158.0,
                  width: 180.0,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: RichText(
                  text: const TextSpan(text: "Powered By", children: [
                    TextSpan(
                        text: " software cloud 2",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ColorResources.disabledColor))
                  ],  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorResources.WHITE)),
                )),
          ],
        ));
  }
}

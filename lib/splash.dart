import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    Future.delayed(const Duration(milliseconds: 4500), () {
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
        body: SafeArea(
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Center(
                  child:Image.asset(
                    Images.splash,


                  ),
                ).animate()
                    .scale(duration: 500.ms)
                    .then(delay: 200.ms) // baseline=800ms
                    .slide()  .scaleXY(duration: 600.ms)  .then(delay: 200.ms).shimmer(duration: 1000.ms) ,
              ),
              RichText(
                text: const TextSpan(text: "Powered By", children: [
                  TextSpan(
                      text: " software cloud 2",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ColorResources.GOLD_COLOR))
                ],  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ColorResources.PRIMARY)),
              ).animate().slideY().then(delay: 2000.ms).slide() .shimmer(duration: 1000.ms) ,
            ],
          ),
        ));
  }
}

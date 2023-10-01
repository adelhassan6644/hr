import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/images.dart';
import '../../../data/config/di.dart';
import '../provider/splash_provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(Duration.zero, () => sl<SplashProvider>().startTheApp());
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                Images.appLogo,
                width: context.width * .7,
              ),
            )
                .animate()
                .scale(duration: 500.ms)
                .then(delay: 200.ms) // baseline=800ms
                .slide()
                .scaleXY(duration: 600.ms)
                .then(delay: 200.ms)
                .shimmer(duration: 1000.ms),
          ),
          RichText(
            text: const TextSpan(
                text: "Powered By",
                children: [
                  TextSpan(
                      text: " software cloud 2",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Styles.GOLD_COLOR))
                ],
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Styles.PRIMARY_COLOR)),
          )
              .animate()
              .slideY()
              .then(delay: 2000.ms)
              .slide()
              .shimmer(duration: 1000.ms),
          SizedBox(height: 40.h),
        ],
      ),
    ));
  }
}

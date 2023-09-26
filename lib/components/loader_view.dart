import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../app/core/images.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.appLogo,
          height: MediaQuery.of(context).size.width * .5,
          width: MediaQuery.of(context).size.width * .5,
        ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              duration: .5.seconds,
            ),
      ],
    ));
  }
}

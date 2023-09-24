import 'package:flutter/cupertino.dart';
import '../../../data/config/di.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';
import '../repo/splash_repo.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;
  SplashProvider({required this.splashRepo});

  startTheApp() {
    Future.delayed(const Duration(milliseconds: 4500), () {
     if (!splashRepo.isLogin()) {
        CustomNavigator.push(Routes.LOGIN, clean: true);
      } else {
        CustomNavigator.push(Routes.DASHBOARD, clean: true, arguments: 0);
      }
      // sl<ConfigProvider>()
      //   ..getContact()
      //   ..getSetting();
    });
  }
}

import 'package:flutter/cupertino.dart';
import '../../../helpers/permission_handler.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';
import '../repo/splash_repo.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;
  SplashProvider({required this.splashRepo});

  startTheApp() {
    Future.delayed(const Duration(milliseconds: 4500), () async {
      ///Ask Notification Permission
      await PermissionHandler.checkNotificationsPermission();

      if (!splashRepo.isLogin()) {
        // CustomNavigator.push(Routes.LOGIN, clean: true);
        CustomNavigator.push(Routes.AddDomain, clean: true);
      } else {
        CustomNavigator.push(Routes.DASHBOARD, clean: true, arguments: 0);
      }
      // sl<ConfigProvider>()
      //   ..getContact()
      //   ..getSetting();
    });
  }
}

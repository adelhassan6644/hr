import 'package:flutter/material.dart';
import 'package:yusrPlus/features/profile/provider/profile_provider.dart';
import 'package:yusrPlus/main_page/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../data/config/di.dart';
import '../../data/network/netwok_info.dart';
import '../../features/attendance/page/attendance.dart';
import '../../features/home/page/home.dart';
import '../../features/more/page/more.dart';
import '../../features/requests/page/requests.dart';
import '../widget/nav_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    NetworkInfoServices.checkConnectivity();
    Future.delayed(Duration.zero, () => sl<DashboardProvider>().init());
    Future.delayed(Duration.zero, () => sl<ProfileProvider>().getProfile());
    super.initState();
  }

  Widget fragment(int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const Requests();
      case 2:
        return const Attendance();
      case 3:
        return const More();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.BACKGROUND_COLOR,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Consumer<DashboardProvider>(builder: (_, provider, child) {
              return fragment(provider.selectedIndex);
            }),
            const NavBar(),
          ],
        ));
  }
}

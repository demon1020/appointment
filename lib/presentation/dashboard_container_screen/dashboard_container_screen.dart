import 'package:appointment/core/app_export.dart';
import 'package:appointment/presentation/dashboard_page/dashboard_page.dart';
import 'package:appointment/presentation/message_page/message_page.dart';
import 'package:appointment/presentation/schedule_page/schedule_page.dart';
import 'package:appointment/presentation/settigns_page/settigns_page.dart';
import 'package:appointment/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DashboardContainerScreen extends StatelessWidget {
  DashboardContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.dashboardPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.Messages:
        return AppRoutes.messagePage;
      case BottomBarEnum.Appointment:
        return AppRoutes.schedulePage;
      case BottomBarEnum.Profile:
        return AppRoutes.settignsPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage();
      case AppRoutes.messagePage:
        return MessagePage();
      case AppRoutes.schedulePage:
        return SchedulePage();
      case AppRoutes.settignsPage:
        return SettignsPage();
      default:
        return DefaultWidget();
    }
  }
}

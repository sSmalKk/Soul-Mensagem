import 'package:flutter/material.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/create_mensage_screen/create_mensage_screen.dart';
import '../presentation/login_register_screen/login_register_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String createMensageScreen = '/create_mensage_screen';

  static const String loginRegisterScreen = '/login_register_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        homeContainerScreen: HomeContainerScreen.builder,
        createMensageScreen: CreateMensageScreen.builder,
        loginRegisterScreen: LoginRegisterScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: LoginRegisterScreen.builder
      };
}

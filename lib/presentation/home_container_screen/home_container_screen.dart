import 'package:gustavo_smalk_s_application65/presentation/home_page/home_page.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_bottom_app_bar.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_floating_button.dart';
import 'models/home_container_model.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_smalk_s_application65/core/app_export.dart';
import 'bloc/home_container_bloc.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatelessWidget {
  HomeContainerScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeContainerBloc>(
      create: (context) => HomeContainerBloc(HomeContainerState(
        homeContainerModelObj: HomeContainerModel(),
      ))
        ..add(HomeContainerInitialEvent()),
      child: HomeContainerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContainerBloc, HomeContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Navigator(
              key: navigatorKey,
              initialRoute: AppRoutes.homePage,
              onGenerateRoute: (routeSetting) => PageRouteBuilder(
                pageBuilder: (ctx, ani, ani1) =>
                    getCurrentPage(context, routeSetting.name!),
                transitionDuration: Duration(seconds: 0),
              ),
            ),
            bottomNavigationBar: _buildBottombarWithFloating(context),
            floatingActionButton: CustomFloatingButton(
              height: 56,
              width: 56,
              backgroundColor: appTheme.red90001,
              child: CustomImageView(
                imagePath: ImageConstant.imgUPen,
                height: 28.0.v,
                width: 28.0.h,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBottombarWithFloating(BuildContext context) {
    return CustomBottomAppBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Map:
        return AppRoutes.homePage;
      case BottomBarEnum.Pay:
        return "/";
      case BottomBarEnum.Saved:
        return "/";
      case BottomBarEnum.Settings:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}

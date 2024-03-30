import 'package:gustavo_smalk_s_application65/presentation/home_page/home_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:gustavo_smalk_s_application65/core/utils/validation_functions.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_text_form_field.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_bottom_app_bar.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_floating_button.dart';
import 'models/login_register_model.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_smalk_s_application65/core/app_export.dart';
import 'bloc/login_register_bloc.dart';

// ignore_for_file: must_be_immutable
class LoginRegisterScreen extends StatelessWidget {
  LoginRegisterScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginRegisterBloc>(
      create: (context) => LoginRegisterBloc(LoginRegisterState(
        loginRegisterModelObj: LoginRegisterModel(),
      ))
        ..add(LoginRegisterInitialEvent()),
      child: LoginRegisterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: 749.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [_buildDark(context), _buildFrameOne(context)],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottombarWithFloating(context),
        floatingActionButton: CustomFloatingButton(
          height: 56,
          width: 56,
          backgroundColor: appTheme.red90001,
          child: CustomImageView(
            imagePath: ImageConstant.imgFiSend,
            height: 28.0.v,
            width: 28.0.h,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Section Widget
  Widget _buildDark(BuildContext context) {
    return SizedBox(
      height: SizeUtils.height,
      width: double.maxFinite,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            37.43296265331129,
            -122.08832357078792,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildTextFieldFill(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillBlack900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Text(
            "lbl_login".tr,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 6.v),
          BlocSelector<LoginRegisterBloc, LoginRegisterState,
              TextEditingController?>(
            selector: (state) => state.emailController,
            builder: (context, emailController) {
              return CustomTextFormField(
                controller: emailController,
                hintText: "msg_example_example_com".tr,
                textInputType: TextInputType.emailAddress,
                prefix: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 13.h,
                    vertical: 11.v,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgLeftIcon,
                    height: 14.adaptSize,
                    width: 14.adaptSize,
                  ),
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 36.v,
                ),
                suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 11.v, 13.h, 11.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgRightIcon,
                    height: 14.adaptSize,
                    width: 14.adaptSize,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 36.v,
                ),
                validator: (value) {
                  if (value == null ||
                      (!isValidEmail(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_email".tr;
                  }
                  return null;
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameOne(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 27.h,
          right: 33.h,
          bottom: 270.v,
        ),
        padding: EdgeInsets.all(5.h),
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextFieldFill(context),
            SizedBox(
              height: 79.v,
              width: 320.h,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: AppDecoration.fillBlack900,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_password".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                          SizedBox(height: 7.v),
                          BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
                            builder: (context, state) {
                              return CustomTextFormField(
                                controller: state.passwordController,
                                hintText: "lbl".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 13.h,
                                    vertical: 11.v,
                                  ),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgUpadlock,
                                    height: 14.adaptSize,
                                    width: 14.adaptSize,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 36.v,
                                ),
                                suffix: InkWell(
                                  onTap: () {
                                    context.read<LoginRegisterBloc>().add(
                                        ChangePasswordVisibilityEvent(
                                            value: !state.isShowPassword));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.h, 11.v, 13.h, 11.v),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgUeye,
                                      height: 14.adaptSize,
                                      width: 14.adaptSize,
                                    ),
                                  ),
                                ),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 36.v,
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_password"
                                        .tr;
                                  }
                                  return null;
                                },
                                obscureText: state.isShowPassword,
                              );
                            },
                          ),
                          SizedBox(height: 19.v)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "msg_at_least_one_uppercase".tr,
                      style: CustomTextStyles.bodySmallBlack900,
                    ),
                  )
                ],
              ),
            ),
            Text(
              "msg_mensage_complete".tr,
              style: theme.textTheme.bodySmall,
            )
          ],
        ),
      ),
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

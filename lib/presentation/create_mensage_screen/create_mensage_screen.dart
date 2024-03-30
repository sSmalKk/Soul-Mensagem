import 'package:gustavo_smalk_s_application65/presentation/home_page/home_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:gustavo_smalk_s_application65/widgets/custom_text_form_field.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_drop_down.dart';
import 'models/create_mensage_model.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_bottom_app_bar.dart';
import 'package:gustavo_smalk_s_application65/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:gustavo_smalk_s_application65/core/app_export.dart';
import 'bloc/create_mensage_bloc.dart';

class CreateMensageScreen extends StatelessWidget {
  CreateMensageScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<CreateMensageBloc>(
      create: (context) => CreateMensageBloc(CreateMensageState(
        createMensageModelObj: CreateMensageModel(),
      ))
        ..add(CreateMensageInitialEvent()),
      child: CreateMensageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 749.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildDark(context),
              _buildFrameOne(context),
            ],
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
        //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
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
  Widget _buildDropdownFill(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillBlack900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_conselho_dica".tr,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 5.v),
          BlocSelector<CreateMensageBloc, CreateMensageState,
              CreateMensageModel?>(
            selector: (state) => state.createMensageModelObj,
            builder: (context, createMensageModelObj) {
              return CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 9.v, 13.h, 9.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgUangledown,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                hintText: "lbl_option".tr,
                items: createMensageModelObj?.dropdownItemList1 ?? [],
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDropdownFill1(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillBlack900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_conteudo".tr,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 5.v),
          BlocSelector<CreateMensageBloc, CreateMensageState,
              CreateMensageModel?>(
            selector: (state) => state.createMensageModelObj,
            builder: (context, createMensageModelObj) {
              return CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 9.v, 13.h, 9.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgUangledown,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                hintText: "lbl_option".tr,
                items: createMensageModelObj?.dropdownItemList2 ?? [],
              );
            },
          ),
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
          left: 31.h,
          right: 22.h,
          bottom: 87.v,
        ),
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "msg_formato_da_mensagem".tr,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 4.v),
                BlocSelector<CreateMensageBloc, CreateMensageState,
                    TextEditingController?>(
                  selector: (state) => state.inputBoxController,
                  builder: (context, inputBoxController) {
                    return CustomTextFormField(
                      controller: inputBoxController,
                      hintText: "lbl_option".tr,
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 9.v, 13.h, 9.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgUangledown,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 34.v,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 10.h,
                        top: 9.v,
                        bottom: 9.v,
                      ),
                      borderDecoration: TextFormFieldStyleHelper.fillBlueGray,
                    );
                  },
                ),
              ],
            ),
            Container(
              decoration: AppDecoration.fillBlack900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  Text(
                    "lbl_cumprimento".tr,
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 4.v),
                  BlocSelector<CreateMensageBloc, CreateMensageState,
                      CreateMensageModel?>(
                    selector: (state) => state.createMensageModelObj,
                    builder: (context, createMensageModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 9.v, 13.h, 9.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgUangledown,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                          ),
                        ),
                        hintText: "lbl_option".tr,
                        items: createMensageModelObj?.dropdownItemList ?? [],
                      );
                    },
                  ),
                ],
              ),
            ),
            _buildDropdownFill(context),
            _buildDropdownFill1(context),
            Container(
              decoration: AppDecoration.fillBlack900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_detalhe".tr,
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 5.v),
                  BlocSelector<CreateMensageBloc, CreateMensageState,
                      CreateMensageModel?>(
                    selector: (state) => state.createMensageModelObj,
                    builder: (context, createMensageModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 9.v, 13.h, 9.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgUangledown,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                          ),
                        ),
                        hintText: "lbl_option".tr,
                        items: createMensageModelObj?.dropdownItemList3 ?? [],
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: AppDecoration.fillBlack900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_encerramento".tr,
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 5.v),
                  BlocSelector<CreateMensageBloc, CreateMensageState,
                      CreateMensageModel?>(
                    selector: (state) => state.createMensageModelObj,
                    builder: (context, createMensageModelObj) {
                      return CustomDropDown(
                        icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 9.v, 13.h, 9.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgUangledown,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                          ),
                        ),
                        hintText: "lbl_option".tr,
                        items: createMensageModelObj?.dropdownItemList4 ?? [],
                      );
                    },
                  ),
                ],
              ),
            ),
            Text(
              "msg_mensage_complete".tr,
              style: theme.textTheme.bodySmall,
            ),
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

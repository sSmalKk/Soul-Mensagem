import 'package:flutter/material.dart';
import 'package:gustavo_smalk_s_application65/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgNavMap,
        activeIcon: ImageConstant.imgNavMap,
        title: "lbl_map".tr.toUpperCase(),
        type: BottomBarEnum.Map,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgNavPay,
      activeIcon: ImageConstant.imgNavPay,
      title: "lbl_pay".tr.toUpperCase(),
      type: BottomBarEnum.Pay,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSaved,
      activeIcon: ImageConstant.imgNavSaved,
      title: "lbl_saved".tr.toUpperCase(),
      type: BottomBarEnum.Saved,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSettings,
      activeIcon: ImageConstant.imgNavSettings,
      title: "lbl_settings".tr.toUpperCase(),
      type: BottomBarEnum.Settings,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: 24.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              return InkWell(
                onTap: () {
                  for (var element in bottomMenuList) {
                    element.isSelected = false;
                  }
                  bottomMenuList[index].isSelected = true;
                  widget.onChanged?.call(bottomMenuList[index].type);
                  setState(() {});
                },
                child: bottomMenuList[index].isSelected
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: bottomMenuList[index].activeIcon,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            color: appTheme.red90001,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              bottomMenuList[index].title ?? "",
                              style:
                                  CustomTextStyles.labelMediumRed90001.copyWith(
                                color: appTheme.red90001,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: bottomMenuList[index].icon,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            color: appTheme.red900,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.v),
                            child: Text(
                              bottomMenuList[index].title ?? "",
                              style: theme.textTheme.labelMedium!.copyWith(
                                color: appTheme.red900,
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Map,
  Pay,
  Saved,
  Settings,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

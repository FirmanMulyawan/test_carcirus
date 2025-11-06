import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../component/config/app_const.dart';
import '../../../component/config/app_style.dart';
import 'bottom_nav_controller.dart';

class BottomNavScreen extends GetView<BottomNavController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      body: GetBuilder<BottomNavController>(
        builder: (ctrl) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: ctrl.selectedScreen,
                      children: ctrl.screenList,
                    ),
                  ),
                  _navbarItem(context),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _navbarItem(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppStyle.lightGrey,
            width: 1.5,
          ),
        ),
      ),
      child: Column(
        children: [
          _bottomTabs(context),
        ],
      ),
    );
  }

  Widget _bottomTabs(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (ctrl) {
        return Row(
          children: [
            _bottomTabItem(
              context: context,
              isAvtive: ctrl.selectedScreen == 0,
              title: "Rent",
              onTap: () {
                ctrl.setSelectedScreen(0);
              },
              icon: _iconBottomTab(
                value: AppConst.rental,
                isActive: ctrl.selectedScreen == 0 ? true : false,
              ),
            ),
            _bottomTabItem(
              context: context,
              isAvtive: ctrl.selectedScreen == 1,
              title: "My Car",
              onTap: () {
                ctrl.setSelectedScreen(1);
              },
              icon: _iconBottomTab(
                value: AppConst.myCar,
                isActive: ctrl.selectedScreen == 1 ? true : false,
              ),
            ),
            _bottomTabItem(
              context: context,
              isAvtive: ctrl.selectedScreen == 2,
              title: "My Bills",
              onTap: () {
                ctrl.setSelectedScreen(2);
              },
              icon: _iconBottomTab(
                value: AppConst.invoice,
                isActive: ctrl.selectedScreen == 2 ? true : false,
              ),
            ),
            _bottomTabItem(
              context: context,
              isAvtive: ctrl.selectedScreen == 3,
              title: "Profile",
              onTap: () {
                ctrl.setSelectedScreen(3);
              },
              icon: _iconBottomTab(
                value: AppConst.person,
                isActive: ctrl.selectedScreen == 3 ? true : false,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _bottomTabItem(
      {void Function()? onTap,
      required Widget icon,
      required BuildContext context,
      required bool isAvtive,
      required String title}) {
    double bottom = MediaQuery.of(context).padding.bottom;
    bottom = bottom > 0 ? bottom : 17;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 17, bottom: bottom),
          child: Column(
            children: [
              icon,
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: AppStyle.medium(
                    size: 12,
                    textColor: isAvtive == true
                        ? AppStyle.primaryColor
                        : AppStyle.greyDark),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBottomTab({
    String value = "",
    bool isActive = false,
  }) {
    return SvgPicture.asset(
      value,
      width: 25,
      height: 25,
      colorFilter: ColorFilter.mode(
        isActive == true ? AppStyle.primaryColor : AppStyle.grey,
        BlendMode.srcIn,
      ),
    );
  }
}

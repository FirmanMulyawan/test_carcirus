import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../component/config/app_const.dart';
import '../../../component/config/app_style.dart';
import 'home_controller.dart';
import 'widget/card_reason.dart';
import 'widget/card_rent.dart';
import 'widget/popup_date.dart';
import 'widget/popup_pic_car.dart';
import 'widget/popup_time.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(bottom: false, child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppStyle.secondary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppConst.logo,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Looking for a car rental?",
                        style: AppStyle.bold(
                            size: 20, textColor: AppStyle.whiteColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Book now and enjoy 10% off your first\nweek's rental!",
                        style: AppStyle.medium(
                            size: 16, textColor: AppStyle.whiteColor),
                      ),
                    ],
                  )),
              SizedBox(height: height * 0.16),
              CardReason(),
              CardRent(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
          Positioned(
            top: height * 0.16,
            left: 16,
            right: 16,
            child: IgnorePointer(
              ignoring: false,
              child: Material(
                color: Colors.transparent,
                child: _pickupDateTime(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pickupDateTime() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppStyle.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick-up date",
            style: AppStyle.semiBold(),
          ),
          SizedBox(
            height: 4,
          ),
          _pickUpDate(),
          SizedBox(
            height: 16,
          ),
          Text(
            "Pick-up time",
            style: AppStyle.semiBold(),
          ),
          SizedBox(
            height: 4,
          ),
          _pickUpTime(),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.bottomSheet(isScrollControlled: true, PopupPicCar());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyle.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Select My Car",
                style:
                    AppStyle.semiBold(size: 16, textColor: AppStyle.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pickUpDate() {
    return TextField(
      autocorrect: false,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: () {
        Get.bottomSheet(
          isScrollControlled: true,
          PopupDate(),
        );
      },
      readOnly: true,
      style: AppStyle.regular(),
      decoration: InputDecoration(
        hintText: 'Date...',
        hintStyle: AppStyle.regular(
          textColor: AppStyle.gray300,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: AppStyle.gray300,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: AppStyle.gray300,
            width: 1,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(left: 14, right: 14),
          child: SvgPicture.asset(
            AppConst.date,
          ),
        ),
        fillColor: AppStyle.whiteColor,
        filled: true,
      ),
    );
  }

  Widget _pickUpTime() {
    return TextField(
      autocorrect: false,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: () {
        Get.bottomSheet(isScrollControlled: true, PopupTime());
      },
      readOnly: true,
      style: AppStyle.regular(),
      decoration: InputDecoration(
        hintText: 'Time...',
        hintStyle: AppStyle.regular(
          textColor: AppStyle.gray300,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: AppStyle.gray300,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: AppStyle.gray300,
            width: 1,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(left: 14, right: 14),
          child: SvgPicture.asset(
            AppConst.time,
          ),
        ),
        fillColor: AppStyle.whiteColor,
        filled: true,
      ),
    );
  }
}

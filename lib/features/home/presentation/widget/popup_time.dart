import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../home_controller.dart';

class PopupTime extends GetView<HomeController> {
  const PopupTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 24, left: 23, right: 23, bottom: 40),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  AppConst.close,
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Pick-up Time",
              style: AppStyle.semiBold(size: 18, textColor: AppStyle.black),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 120,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                use24hFormat: false,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {},
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyle.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Apply",
                  style: AppStyle.semiBold(
                      size: 16, textColor: AppStyle.whiteColor),
                ),
              ),
            ),
          ],
        ));
  }
}

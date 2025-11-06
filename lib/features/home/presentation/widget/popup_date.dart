import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../home_controller.dart';

class PopupDate extends GetView<HomeController> {
  const PopupDate({super.key});

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
              "Pick-up Date",
              style: AppStyle.semiBold(size: 18, textColor: AppStyle.black),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: AppStyle.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppStyle.lightGrey,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      AppConst.arrowLeft,
                    ),
                  ),
                  Text(
                    "August 2024",
                    style: AppStyle.semiBold(
                        size: 15, textColor: AppStyle.baseBlack),
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      AppConst.arrowRight,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SfDateRangePicker(
              // view: DateRangePickerView.month,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                dayFormat: 'EEE',
              ),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {},
              selectionMode: DateRangePickerSelectionMode.single,
              showTodayButton: false,
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

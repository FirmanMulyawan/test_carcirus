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
                    onTap: () => controller.previousMonth(),
                    child: SvgPicture.asset(
                      AppConst.arrowLeft,
                    ),
                  ),
                  Obx(() {
                    return Text(
                      controller.activeMonthYear.value,
                      style: AppStyle.semiBold(
                          size: 15, textColor: AppStyle.baseBlack),
                    );
                  }),
                  InkWell(
                    onTap: () => controller.nextMonth(),
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
              enableMultiView: false,
              enablePastDates: true,
              endRangeSelectionColor: AppStyle.whiteSmoke,
              rangeSelectionColor: AppStyle.whiteSmoke,
              startRangeSelectionColor: AppStyle.whiteSmoke,
              showActionButtons: false,
              view: DateRangePickerView.month,
              minDate: DateTime.now(),
              controller: controller.pickerController,
              monthViewSettings: DateRangePickerMonthViewSettings(
                dayFormat: 'EEE',
                showTrailingAndLeadingDates: true,
                specialDates: [DateTime.now()],
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle:
                      AppStyle.medium(size: 13, textColor: AppStyle.blackDark),
                ),
              ),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                final PickerDateRange range = args.value;
                controller.selectedRange.value = range;
              },
              onViewChanged: (DateRangePickerViewChangedArgs args) =>
                  controller.updateActiveMonthYear(args),
              selectionMode: DateRangePickerSelectionMode.range,
              showTodayButton: false,
              todayHighlightColor: AppStyle.primaryColor,
              navigationMode: DateRangePickerNavigationMode.none,
              headerHeight: 0,
              monthCellStyle: DateRangePickerMonthCellStyle(
                trailingDatesTextStyle:
                    AppStyle.regular(size: 13, textColor: AppStyle.neutral300),
                leadingDatesTextStyle:
                    AppStyle.regular(size: 13, textColor: AppStyle.neutral300),
                textStyle:
                    AppStyle.regular(size: 13, textColor: AppStyle.blackDark),
                specialDatesDecoration: BoxDecoration(
                  color: AppStyle.primaryColor,
                  shape: BoxShape.circle,
                ),
                specialDatesTextStyle:
                    AppStyle.regular(size: 13, textColor: AppStyle.whiteColor),
              ),
              // showNavigationArrow: false,
              selectionTextStyle:
                  AppStyle.regular(size: 13, textColor: AppStyle.blackDark),
            ),
            SizedBox(
              height: 36,
            ),
            Obx(() {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.selectedRange.value == null
                      ? null
                      : () => controller.changeDate(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle.primaryColor,
                    disabledBackgroundColor: AppStyle.primaryLight,
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
              );
            }),
          ],
        ));
  }
}

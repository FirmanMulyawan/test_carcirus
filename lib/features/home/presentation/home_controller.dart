import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../component/config/app_const.dart';
import '../../../component/config/app_style.dart';
import '../../../component/util/helper.dart';

class HomeController extends GetxController {
  int? selectedCar;
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final Rxn<DateTime> selectedTime = Rxn<DateTime>();

  final DateRangePickerController pickerController =
      DateRangePickerController();
  final activeMonthYear = ''.obs;
  final selectedRange = Rx<PickerDateRange?>(null);

  HomeController();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  void setSelectedCar(int value) {
    selectedCar = value;
    update();
  }

  void applyButton() {
    final time =
        DateFormat('hh:mm a').format(selectedTime.value ?? DateTime.now());
    timeController.text = time;
    update();
    Get.back();
  }

  void changeTime(DateTime newDateTime) {
    selectedTime.value = newDateTime;
  }

  void changeDate() {
    if (selectedRange.value != null) {
      final PickerDateRange range = selectedRange.value ??
          PickerDateRange(DateTime.now(), DateTime.now());

      final DateTime start = range.startDate != null
          ? DateTime(range.startDate!.year, range.startDate!.month,
              range.startDate!.day)
          : DateTime.now();

      final DateTime? end = range.endDate != null
          ? DateTime(
              range.endDate!.year, range.endDate!.month, range.endDate!.day)
          : null;

      dateController.text =
          "${DateFormat('dd MMM yyyy').format(start)} - ${DateFormat('dd MMM yyyy').format(end ?? start)}";
      update();
      Get.back();
    }
  }

  void isPickCar() async {
    Get.back();
    AlertModel.showAlertDefault(
        title: "Your booking has created!",
        message: "Our team will checking available car and assign it to you",
        image: AppConst.checkDuotone,
        button: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    // padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppStyle.lightGrey, width: 1),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Cancel",
                    style: AppStyle.semiBold(
                        size: 14, textColor: AppStyle.neutral800),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle.primaryColor,
                    // padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "See Booking",
                    style: AppStyle.semiBold(
                        size: 14, textColor: AppStyle.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void nextMonth() {
    if (pickerController.forward != null) {
      pickerController.forward!();
    }
  }

  void previousMonth() {
    if (pickerController.backward != null) {
      pickerController.backward!();
    }
  }

  void updateActiveMonthYear(DateRangePickerViewChangedArgs args) {
    final visibleDate = args.visibleDateRange.startDate ?? DateTime.now();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      activeMonthYear.value =
          "${_monthName(visibleDate.month)} ${visibleDate.year}";
    });
  }

  String _monthName(int month) {
    const names = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return names[month];
  }
}

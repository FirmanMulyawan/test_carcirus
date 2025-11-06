import 'package:get/get.dart';

class HomeController extends GetxController {
  int? selectedCar;

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
}

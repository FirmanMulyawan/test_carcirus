import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_center/notification_center.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../component/database/database_car.dart';
import '../../component/model/my_car_model.dart';

class MyCarController extends GetxController {
  DatabaseCarManager database = DatabaseCarManager.instance;
  final dataMyCar = <MyCarModel>[].obs;

  MyCarController();

  @override
  void onInit() {
    super.onInit();
    loadMyCar();

    NotificationCenter().subscribe('refresh-my-car', (_) {
      loadMyCar();
    });
  }

  Future<void> loadMyCar() async {
    Database db = await database.db;
    List<Map<String, dynamic>> data = await db.query('car', orderBy: 'id DESC');

    final list = data.map((e) => MyCarModel.fromMap(e)).toList();

    dataMyCar.assignAll(list);
  }

  void deleteMyCar() async {
    Database db = await database.db;
    await db.delete("car", where: "id = 1");
    Get.snackbar("Success", "Succes delete Car", colorText: Colors.white);
    await loadMyCar();
  }
}

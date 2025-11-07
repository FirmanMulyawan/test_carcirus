import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../component/config/app_style.dart';
import 'my_car_controller.dart';

class MyCarScreen extends GetView<MyCarController> {
  const MyCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.black,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "My Car",
          style: AppStyle.bold(size: 20, textColor: Colors.white),
        ),
      ),
      body: SafeArea(bottom: false, child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() {
                  if (controller.dataMyCar.isEmpty) {
                    return const Center(child: Text('Data Not Found'));
                  }
                  return ListView.builder(
                    itemCount: controller.dataMyCar.length,
                    itemBuilder: (context, index) {
                      final dataMyCar = controller.dataMyCar[index];

                      return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: () => controller.deleteMyCar(),
                            child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(16)),
                                      child: Image.asset(
                                        dataMyCar.image,
                                        height: 100,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dataMyCar.name,
                                            style: AppStyle.bold(size: 18),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                dataMyCar.type,
                                                style: AppStyle.medium(
                                                    size: 16,
                                                    textColor:
                                                        AppStyle.neutral300),
                                              ),
                                              Text(
                                                '\$${dataMyCar.price}/week',
                                                style: AppStyle.bold(
                                                    size: 16,
                                                    textColor:
                                                        AppStyle.primaryColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pick-up Date',
                                                    style: AppStyle.regular(
                                                        size: 14,
                                                        textColor: AppStyle
                                                            .neutral300),
                                                  ),
                                                  Text(
                                                    dataMyCar.date,
                                                    style: AppStyle.semiBold(
                                                        size: 14,
                                                        textColor:
                                                            AppStyle.baseBlack),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pick-up Time',
                                                    style: AppStyle.regular(
                                                        size: 14,
                                                        textColor: AppStyle
                                                            .neutral300),
                                                  ),
                                                  Text(
                                                    dataMyCar.time,
                                                    style: AppStyle.semiBold(
                                                        size: 14,
                                                        textColor:
                                                            AppStyle.baseBlack),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ));
                    },
                  );
                }),
              )
            ]));
  }
}

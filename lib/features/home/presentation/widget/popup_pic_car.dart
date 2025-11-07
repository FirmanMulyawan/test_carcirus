import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../home_controller.dart';

class PopupPicCar extends GetView<HomeController> {
  const PopupPicCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          bottom: false,
          top: true,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        AppConst.backButton,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      "Pick a Car",
                      style: AppStyle.semiBold(
                          size: 18, textColor: AppStyle.black),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder<HomeController>(builder: (ctrl) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 200),
                    itemCount: ctrl.listCar.length,
                    itemBuilder: (context, index) {
                      final isSelected = ctrl.selectedCar;
                      final listCar = ctrl.listCar;

                      return InkWell(
                        onTap: () => ctrl.setSelectedCar(listCar[index]),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                            color: AppStyle.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected?.name == listCar[index].name
                                  ? AppStyle.primaryColor
                                  : AppStyle.lightGrey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(listCar[index].image),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listCar[index].type,
                                        style: AppStyle.semiBold(
                                            size: 18, textColor: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(listCar[index].name,
                                          style: AppStyle.regular(
                                            size: 14,
                                            textColor: Colors.black
                                                .withValues(alpha: 0.6),
                                          )),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: AppStyle.semiBold(
                                          size: 20, textColor: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: "\$ ${listCar[index].price}",
                                            style: AppStyle.semiBold(
                                                size: 20,
                                                textColor:
                                                    AppStyle.blackLight)),
                                        TextSpan(
                                          text: "/week",
                                          style: AppStyle.regular(
                                            size: 14,
                                            textColor: AppStyle.neutral,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  );
                }),
              ),
              GetBuilder<HomeController>(builder: (ctrl) {
                final isSelected = ctrl.selectedCar;

                return Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 40),
                  child: ElevatedButton(
                    onPressed:
                        isSelected == null ? null : () => ctrl.isPickCar(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyle.primaryColor,
                      disabledBackgroundColor: AppStyle.primaryLight,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Book Now",
                      style: AppStyle.semiBold(
                          size: 16, textColor: AppStyle.whiteColor),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

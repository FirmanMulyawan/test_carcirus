import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';

class CardReason extends StatelessWidget {
  const CardReason({super.key});

  @override
  Widget build(BuildContext context) {
    final listReason = [
      {
        'icon': AppConst.layer1,
        'title': "Start with \$300/week",
      },
      {
        'icon': AppConst.layer2,
        'title': 'Well maintained cars',
      },
      {
        'icon': AppConst.layer3,
        'title': 'Reasonable price',
      },
      {
        'icon': AppConst.layer4,
        'title': 'Drive with unlimited mileage',
      }
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: AppStyle.semiBold(size: 20, textColor: Colors.black),
              children: [
                const TextSpan(text: "Why "),
                TextSpan(
                  text: "CarCirus",
                  style: AppStyle.extraBold(
                    size: 20,
                    textColor: AppStyle.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          AlignedGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              addRepaintBoundaries: false,
              itemCount: listReason.length,
              itemBuilder: (ctx, index) {
                int crossAxisCount = 2;
                int row = index ~/ crossAxisCount;
                int col = index % crossAxisCount;
                int realIndex =
                    col * (listReason.length ~/ crossAxisCount) + row;

                return GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        listReason[realIndex]['icon']!,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                          child: Text(
                        "${listReason[realIndex]['title']}",
                        style: AppStyle.semiBold(
                            size: 12, textColor: AppStyle.lightBlack),
                      ))
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}

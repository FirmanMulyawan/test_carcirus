import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../component/config/app_style.dart';

class CardRent extends StatelessWidget {
  const CardRent({super.key});

  @override
  Widget build(BuildContext context) {
    final listHoTowRent = [
      {
        'title': "Find your ride",
        'description':
            "Set your pick-up date & time. Tap ‘Book Now’ to make a reservation for available car.",
      },
      {
        'title': "Fill the submission form",
        'description':
            "You can fill the form submission and we are going to make sure you are provided by our services.",
      },
      {
        'title': "Pick up the car",
        'description':
            "Go to the designated location at the scheduled time to pick up your rental car. Inspect the vehicle and complete any necessary paperwork.",
      },
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "How to rent car",
            style: AppStyle.semiBold(size: 20, textColor: Colors.black),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 200,
          child: AlignedGridView.count(
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 16,
              itemCount: listHoTowRent.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Container(
                  width: 250,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppStyle.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppStyle.lightGrey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppStyle.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: AppStyle.bold(
                                size: 20, textColor: AppStyle.whiteSmoke),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        listHoTowRent[index]['title']!,
                        style: AppStyle.bold(size: 16, textColor: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        listHoTowRent[index]['description']!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.regular(
                            size: 16, textColor: AppStyle.lightBlack),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}

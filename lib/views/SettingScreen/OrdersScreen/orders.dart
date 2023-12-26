import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe/core/constant/app_text_styles.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/data/bill.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import '../BillDetailsScreen/billDetails.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "${ImagesPath.arrowBackAr}",
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        PaddingCustom(
                          theTop: 8,
                          child: TextCustom(
                              theText: " الطلبات",
                              fontSizeWidth: 22,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.blackColorsTypeOne),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<Bill>>(
                  future: homeController.getbillsFromDatabase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasData) {
                      homeController.setbillsItems(snapshot.data!);
                      return buildeBills(homeController);
                    }
                    return Text("something went wrong");
                  }),
              // Text("data")
            ],
          ),
        ),
      )),
    );
  }

  Container buildeBills(HomeController controller) {
    return Container(
      margin: EdgeInsets.only(top: 24.h),
      height: 98 * controller.billsItems.length.toDouble(),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.billsItems.length,
          itemBuilder: (context, Index) {
            final bill = controller.billsItems[Index];
            return InkWell(
              onTap: () {
                Get.to(BillDetailspage());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4.h),
                height: 90,
                padding: EdgeInsets.all(8),
                color: AppColors.whiteColorTypeTwo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            TextCustom(
                                theText: "رقم الفاتوره",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.blackColorsTypeOne),
                            TextCustom(
                                theText: "${bill.id} ",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.blackColorsTypeOne),
                            TextCustom(
                                theText: "${bill.moreInfo} ",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.blackColorsTypeOne),
                          ],
                        ),
                        Row(
                          children: [
                            TextCustom(
                                theText: "السعر ",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.blackColorsTypeOne),
                            TextCustom(
                                theText: "${bill.totalprice} ",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.blackColorsTypeOne),
                          ],
                        ),
                        TextCustom(
                            theText: "${bill.date}",
                            fontSizeWidth: 15,
                            fontFamily: AppTextStyles.Almarai,
                            fontColor: AppColors.blackColorsTypeOne),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextCustom(
                            theText: "${bill.nameDelliverFor}",
                            fontSizeWidth: 15,
                            fontFamily: AppTextStyles.Almarai,
                            fontColor: AppColors.blackColorsTypeOne),
                        TextCustom(
                            theText: "${bill.numberDeliverFor}",
                            fontSizeWidth: 15,
                            fontFamily: AppTextStyles.Almarai,
                            fontColor: AppColors.blackColorsTypeOne),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          decoration: BoxDecoration(
                              color: AppColors.theAppColorYellow,
                              borderRadius: BorderRadius.circular(50)),
                          child: TextCustom(
                              theText: " ${bill.statuse}",
                              fontSizeWidth: 15,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.blackColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

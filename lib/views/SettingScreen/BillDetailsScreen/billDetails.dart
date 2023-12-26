import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe/customWidgets/custom_padding.dart';
import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../core/data/bill_details.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_text.dart';

class BillDetailspage extends StatelessWidget {
  const BillDetailspage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            PaddingCustom(
                theTop: 30,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: InkWell(
                    onTap: () {
                      // Get.to(ProductDetales());
                    },
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
                                  theText: " التفاصيل",
                                  fontSizeWidth: 22,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontColor: AppColors.blackColorsTypeOne),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: FutureBuilder<List<billDEtail>>(
                  future: homeController.getbillDetailsFromDatabase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final billdetail = snapshot.data!;
                      return buildCart(screenWidth, homeController, billdetail);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Text("data");
                  }),
            ),
          ],
        ),
      )),
    );
  }

  Center buildCart(double screenWidth, HomeController controller,
      List<billDEtail> billdetail) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 400.h,
            child: ListView.builder(
                itemCount: billdetail.length,
                itemBuilder: (context, index) {
                  final details = billdetail[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Stack(
                      children: [
                        Container(
                          width: screenWidth,
                          height: 100.h,
                          color: Color.fromARGB(59, 255, 217, 0),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Container(
                                  child: CustomCachedNetworkImage(
                                    urlTheImage:
                                        details.productImage.toString(),
                                    width: 80,
                                    height: 80,
                                    boxFit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextCustom(
                                            theText: "${details.name}",
                                            fontSizeWidth: 22,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontColor:
                                                AppColors.blackColorsTypeOne),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextCustom(
                                                theText: "العدد",
                                                fontSizeWidth: 18,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontColor: AppColors
                                                    .blackColorsTypeOne),
                                            TextCustom(
                                                theText: "${details.quantity}",
                                                fontSizeWidth: 15,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontColor: AppColors
                                                    .blackColorsTypeOne),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextCustom(
                                          theText: "${details.price}",
                                          fontSizeWidth: 20,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor:
                                              AppColors.blackColorsTypeOne),
                                      TextCustom(
                                          theText:
                                              "${controller.multiplyprice(details.price as double, details.quantity as int)}",
                                          fontSizeWidth: 20,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor:
                                              AppColors.blackColorsTypeOne)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
            child: Container(
              height: 2.h,
              color: Colors.grey[400],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  children: [
                    TextCustom(
                      theText: "الاجمالي : ",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColor,
                      maxLines: 3,
                    ),
                    TextCustom(
                      theText: "${billdetail[0].totalprice}  رس",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColor,
                      maxLines: 3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    TextCustom(
                      theText: "سعر التوصيل : ",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColor,
                      maxLines: 3,
                    ),
                    TextCustom(
                      theText: "50 رس",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColor,
                      maxLines: 3,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextCustom(
                      theText: "المزيد  ",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColor,
                      maxLines: 3,
                    ),
                    TextCustom(
                      theText: "${billdetail[0].moreInfo}",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColor,
                      maxLines: 3,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

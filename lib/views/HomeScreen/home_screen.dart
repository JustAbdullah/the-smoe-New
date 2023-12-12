import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe/core/constant/app_text_styles.dart';
import 'package:smoe/core/constant/appcolors.dart';
import 'package:smoe/core/constant/images_path.dart';
import 'package:smoe/customWidgets/custom_container.dart';
import 'package:smoe/customWidgets/custom_padding.dart';
import 'package:smoe/customWidgets/custom_text.dart';
import 'package:smoe/views/HomeScreen/honeWidgets/favorites.dart';
import 'package:smoe/views/HomeScreen/honeWidgets/main_types.dart';
import 'package:smoe/views/HomeScreen/honeWidgets/offers_list.dart';
import 'package:smoe/views/HomeScreen/honeWidgets/top_header.dart';
import 'package:smoe/views/ProductsScreen/ProductsScreenWidgets/products_list.dart';

import '../../customWidgets/custom_container_api.dart';
import '../ProductsScreen/products_screen.dart';
import 'honeWidgets/highest_rating.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: PaddingCustom(
                theBottom: 50,
                child: Column(children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  PaddingCustom(
                      theTop: 30,
                      theRight: 15,
                      theLeft: 15,
                      child: TopHeader()),
                  SizedBox(
                    height: 10.h,
                  ),
                  PaddingCustom(
                    theTop: 20,
                    theBottom: 0,
                    theLeft: 0,
                    theRight: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: TheOffersList(),
                    ),
                  ),
                  PaddingCustom(
                      theTop: 40,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 10,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextCustom(
                            theText: "الأصناف الرئيسية",
                            fontSizeWidth: 25,
                            fontFamily: AppTextStyles.Almarai,
                            fontColor: AppColors.blackColorsTypeOne),
                      )),
                  PaddingCustom(
                      theTop: 20,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: MainTypes(),
                      )),
                  PaddingCustom(
                      theTop: 20,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 20,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextCustom(
                            theText: "مختاراتنا",
                            fontSizeWidth: 25,
                            fontFamily: AppTextStyles.Almarai,
                            fontColor: AppColors.blackColorsTypeOne),
                      )),
                  PaddingCustom(
                      theTop: 20,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 20,
                      child: Align(
                          alignment: Alignment.topRight, child: Favorites())),
                  PaddingCustom(
                      theTop: 20,
                      theBottom: 0,
                      theLeft: 0,
                      theRight: 20,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextCustom(
                            theText: "الأعلى تقييم",
                            fontSizeWidth: 25,
                            fontFamily: AppTextStyles.Almarai,
                            fontColor: AppColors.blackColorsTypeOne),
                      )),
                  PaddingCustom(
                      theTop: 20,
                      theBottom: 30,
                      theLeft: 0,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: HighestRating())),
                ]),
              ),
            ),
            PaddingCustom(
              theBottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        ContainerCustom(
                            widthContainer: 120,
                            theBorderRadius: 10,
                            heigthContainer: 40,
                            colorContainer: AppColors.theAppColorYellow,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.home}",
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      PaddingCustom(
                                        theTop: 10,
                                        child: TextCustom(
                                            theText: "الرئيسية",
                                            fontSizeWidth: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontColor:
                                                AppColors.blackColorTypeTeo),
                                      ),
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 40.h,
                          width: 0.7.w,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ContainerCustom(
                            widthContainer: 120,
                            theBorderRadius: 10,
                            heigthContainer: 40,
                            colorContainer: AppColors.whiteColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(ProuctsScreen());
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.list}",
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      PaddingCustom(
                                        theTop: 10,
                                        child: TextCustom(
                                            theText: "المنتجات",
                                            fontSizeWidth: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontColor:
                                                AppColors.blackColorTypeTeo),
                                      ),
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 40.h,
                          width: 0.7.w,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ContainerCustom(
                            widthContainer: 120,
                            theBorderRadius: 10,
                            heigthContainer: 40,
                            colorContainer: AppColors.whiteColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "${ImagesPath.settings}",
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      PaddingCustom(
                                        theTop: 10,
                                        child: TextCustom(
                                            theText: "الاعدادات",
                                            fontSizeWidth: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontColor:
                                                AppColors.blackColorTypeTeo),
                                      ),
                                    ],
                                  ),
                                ))),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe/controllers/home_controller.dart';
import 'package:smoe/core/constant/images_path.dart';
import 'package:smoe/customWidgets/custom_container.dart';
import 'package:smoe/customWidgets/custom_container_api.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../HomeScreen/home_screen.dart';
import '../HomeScreen/honeWidgets/highest_rating.dart';
import '../HomeScreen/honeWidgets/main_types.dart';
import 'ProductsScreenWidgets/products_list.dart';

class ProuctsScreen extends StatelessWidget {
  const ProuctsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          PaddingCustom(
              theTop: 30,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: InkWell(
                  onTap: () {
                    Get.to(HomeScreen());
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
                                theText: "قائمة المنتجات",
                                fontSizeWidth: 22,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.blackColorsTypeOne),
                          )
                        ],
                      ),
                      Image.asset(
                        "${ImagesPath.ShoppingCart}",
                        width: 30.w,
                      ),
                    ],
                  ),
                ),
              )),
          PaddingCustom(
              theTop: 20,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFormFiledCustom(
                      labelData: "أبحث عن المنتج بالاسم",
                      hintData: "قم رجاءًا بإدخال اسم المنتج",
                      iconData: Icons.search,
                      controllerData: homeController.nameSearchController,
                      value: (p0) {},
                      fillColor: AppColors.whiteColor,
                      hintColor: AppColors.theAppColorYellow,
                      iconColor: AppColors.balckColorTypeThree,
                      borderSideColor: AppColors.whiteColor,
                      fontColor: AppColors.balckColorTypeThree,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      autofillHints: [AutofillHints.name],
                      onChanged: (p0) {},
                      validator: (p0) {},
                    ),
                  ))),
          PaddingCustom(
            theTop: 15.h,
            child: GetX<HomeController>(
                builder: (controller) => ContainerCustom(
                      widthContainer: MediaQuery.sizeOf(context).width,
                      heigthContainer: MediaQuery.sizeOf(context).height,
                      colorContainer: AppColors.whiteColorTypeOne,
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ContainerCustomApi(
                                    theBorderRadius: 10,
                                    heigthContainer: 40.h,
                                    colorContainer: AppColors.whiteColor,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: InkWell(
                                          onTap: () {
                                            controller
                                                .chaneConditionMainTypes();
                                          },
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                controller.ImageMainType.value,
                                                width: 30.w,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              PaddingCustom(
                                                theTop: 10,
                                                child: TextCustom(
                                                    theText: "الاقسام الرئيسية",
                                                    fontSizeWidth: 15,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontColor: AppColors
                                                        .blackColorTypeTeo),
                                              ),
                                            ],
                                          ),
                                        ))),
                                ContainerCustomApi(
                                    theBorderRadius: 10,
                                    heigthContainer: 40.h,
                                    colorContainer: AppColors.whiteColor,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: InkWell(
                                          onTap: () {
                                            controller.chaneConditionSubTypes();
                                          },
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                controller.ImageSubType.value,
                                                width: 30.w,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              PaddingCustom(
                                                theTop: 10,
                                                child: TextCustom(
                                                    theText: "الاقسام الفرعية",
                                                    fontSizeWidth: 15,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontColor: AppColors
                                                        .blackColorTypeTeo),
                                              ),
                                            ],
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.showTheMainTypes.value,
                          child: PaddingCustom(
                            theTop: 50.h,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: MainTypes(),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.showTheSubTypes.value,
                          child: PaddingCustom(
                            theTop: controller.PaddingTheSubType.value,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: MainTypes(),
                            ),
                          ),
                        ),
                        PaddingCustom(
                            theTop: controller.PaddingTheProducts.value,
                            theBottom: 40,
                            child: ProductsList()),
                      ]),
                    )),
          ),
        ]),
      )),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smoe/core/constant/images_path.dart';
import 'package:smoe/customWidgets/custom_container_api.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getProductsFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ContainerCustom(
              heigthContainer: 170,
              widthContainer: 1300,
              colorContainer: AppColors.whiteColorTypeOne,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return PaddingCustom(
                      theRight: 10,
                      theLeft: 0,
                      child: Column(
                        children: [
                          ContainerCustom(
                            theBorderRadius: 10,
                            colorContainer: AppColors.whiteColor,
                            heigthContainer: 130,
                            widthContainer: 100,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: CustomCachedNetworkImage(
                                    urlTheImage: snapshot.data['data'][i]
                                            ['product_image']
                                        .toString(),
                                    width: 300,
                                    height: 100,
                                    boxFit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: TextCustom(
                                    theText: snapshot.data['data'][i]
                                        ['product_name_ar'],
                                    fontWeight: FontWeight.bold,
                                    fontColor: AppColors.balckColorTypeThree,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSizeWidth: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Row(
                            children: [
                              TextCustom(
                                theText: "معجنات",
                                fontColor: AppColors.balckColorTypeThree,
                                fontFamily: AppTextStyles.Almarai,
                                fontSizeWidth: 12,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              TextCustom(
                                theText: "|",
                                fontColor: AppColors.balckColorTypeThree,
                                fontFamily: AppTextStyles.Almarai,
                                fontSizeWidth: 15,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              TextCustom(
                                theText: "فطائر",
                                fontColor: AppColors.balckColorTypeThree,
                                fontFamily: AppTextStyles.Almarai,
                                fontSizeWidth: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            );
          } else {
            return ContainerCustom(
                heigthContainer: 120,
                widthContainer: 1300,
                colorContainer: AppColors.whiteColorTypeOne,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Shimmer.fromColors(
                          baseColor: Color.fromARGB(31, 83, 82, 82),
                          highlightColor: AppColors.whiteColor,
                          enabled: true,
                          child: PaddingCustom(
                              theRight: 1,
                              theLeft: 1,
                              child: Column(children: [
                                ContainerCustomApi(
                                  colorContainer: AppColors.whiteColorTypeOne,
                                  boxShape: BoxShape.circle,
                                  heigthContainer: 70.h,
                                  child: Image.asset(
                                    "${ImagesPath.LogoApp}",
                                    width: 80,
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                Shimmer.fromColors(
                                    baseColor: Color.fromARGB(31, 83, 82, 82),
                                    highlightColor: AppColors.whiteColor,
                                    enabled: true,
                                    child: TextCustom(
                                      theText: "يتم التحميل",
                                      fontColor: AppColors.whiteColor,
                                      fontFamily: AppTextStyles.Marhey,
                                      fontSizeWidth: 15,
                                    )),
                              ])));
                    }));
          }
        });
  }
}

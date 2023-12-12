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

class MainTypes extends StatelessWidget {
  const MainTypes({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getDataMainTypesFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ContainerCustom(
              heigthContainer: 100,
              widthContainer: 1300,
              colorContainer: AppColors.whiteColorTypeOne,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return PaddingCustom(
                      theRight: 0,
                      theLeft: 0,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ContainerCustomApi(
                              colorContainer: AppColors.whiteColor,
                              boxShape: BoxShape.circle,
                              heigthContainer: 70.h,
                              child: CustomCachedNetworkImage(
                                urlTheImage: snapshot.data['data'][i]
                                        ['type_image']
                                    .toString(),
                                width: 60,
                                height: 100,
                                boxFit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextCustom(
                            theText: snapshot.data['data'][i]['type_name_ar'],
                            fontColor: AppColors.blackColorTypeTeo,
                            fontFamily: AppTextStyles.Marhey,
                            fontSizeWidth: 15,
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

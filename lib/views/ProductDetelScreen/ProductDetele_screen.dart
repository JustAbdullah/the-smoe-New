import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smoe/controllers/home_controller.dart';
import 'package:smoe/core/constant/appcolors.dart';
import 'package:smoe/core/constant/images_path.dart';
import 'package:smoe/core/data/model/products.dart';
import 'package:smoe/customWidgets/custom_padding.dart';
import '../../core/constant/app_text_styles.dart';
import '../../customWidgets/custom_cachednetworkimage.dart';
import '../../customWidgets/custom_text.dart';

class ProductDetales extends StatelessWidget {
  const ProductDetales({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Future<Products>? ProductDetale =
        homeController.getProductDetaleFromDatabase();

    return Scaffold(
        backgroundColor: AppColors.whiteColorTypeOne,
        body: SafeArea(
            child: PaddingCustom(
          theTop: 30,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
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
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: productdetalefuture(ProductDetale, homeController),
                ),
              ],
            ),
          ),
        )));
  }

  FutureBuilder<Products> productdetalefuture(
      Future<Products> ProductDetale, HomeController homeController) {
    return FutureBuilder<Products>(
      future: ProductDetale,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Products data = snapshot.data!;
          return Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.theAppColorYellow,
                child: CustomCachedNetworkImage(
                  urlTheImage: data.image.toString(),
                  width: 400,
                  height: 200,
                  boxFit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextCustom(
                    theText: "${data.name} ",
                    fontSizeWidth: 25,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.blackColorsTypeOne,
                    maxLines: 3,
                  ),
                  TextCustom(
                    theText: " .رس${data.price}.رس ",
                    fontSizeWidth: 20,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.theAppColorYellow,
                    maxLines: 3,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  TextCustom(
                    theText: "${data.evaluation} ",
                    fontSizeWidth: 15,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.theAppColorYellow,
                    maxLines: 3,
                  ),
                  TextCustom(
                    theText: " (مراجعه)",
                    fontSizeWidth: 15,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.theAppColorYellow,
                    maxLines: 3,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              TextCustom(
                theText: "${data.description} ",
                fontSizeWidth: 18,
                fontFamily: AppTextStyles.Almarai,
                fontColor: AppColors.blackColorsTypeOne,
                maxLines: 3,
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFFFC800)),
                      ),
                      onPressed: () {},
                      child: TextCustom(
                        theText: "شراء الان",
                        fontSizeWidth: 20,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.blackColor,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFFFC800)),
                      ),
                      onPressed: () {
                        print("addd");
                        homeController.insertProductCart(data.id!);
                      },
                      child: TextCustom(
                        theText: "اضافه الى السله",
                        fontSizeWidth: 20,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.blackColor,
                        maxLines: 3,
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        } else {
          return Column(
            children: [
              Shimmer.fromColors(
                  baseColor: Color.fromARGB(31, 83, 82, 82),
                  highlightColor: AppColors.whiteColor,
                  enabled: true,
                  child: PaddingCustom(
                      theRight: 1,
                      theLeft: 1,
                      child: Container(
                        width: 400,
                        height: 200,
                      ))),
              Text("looooooding"),
              Shimmer.fromColors(
                  baseColor: Color.fromARGB(31, 83, 82, 82),
                  highlightColor: AppColors.whiteColor,
                  enabled: true,
                  child: PaddingCustom(
                      theRight: 1,
                      theLeft: 1,
                      child: Container(
                        child: Text("dd"),
                        width: 400,
                        height: 200,
                      ))),
              SizedBox(
                height: 16.h,
              ),
              Shimmer.fromColors(
                  baseColor: Color.fromARGB(31, 83, 82, 82),
                  highlightColor: AppColors.whiteColor,
                  enabled: true,
                  child: PaddingCustom(
                      theRight: 1,
                      theLeft: 1,
                      child: Container(
                        width: 400,
                        height: 20,
                      ))),
              SizedBox(
                height: 16.h,
              ),
              Shimmer.fromColors(
                  baseColor: Color.fromARGB(31, 83, 82, 82),
                  highlightColor: AppColors.whiteColor,
                  enabled: true,
                  child: PaddingCustom(
                      theRight: 1,
                      theLeft: 1,
                      child: Container(
                        width: 400,
                        height: 20,
                      ))),
            ],
          );
        }
      },
    );
  }
}

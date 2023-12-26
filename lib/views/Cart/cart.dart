import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe/customWidgets/custom_padding.dart';
import 'package:smoe/views/ProductDetelScreen/ProductDetele_screen.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../core/data/model/cart.dart';
import '../../customWidgets/custom_cachednetworkimage.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_text.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    // Future<List<Cart>> productCartfuture =
    //     homeController.getDataProductCartFromDatabase();

    homeController.cartItemsFuture =
        homeController.getDataProductCartFromDatabase();

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
                      Get.to(ProductDetales());
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
                                  theText: " السله",
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
              child: FutureBuilder<List<Cart>>(
                  future: homeController.cartItemsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      homeController.setCartItems(snapshot.data!);
                      return GetBuilder<HomeController>(builder: (controller) {
                        return buildCart(screenWidth, controller);
                      });
                    }
                    // if (snapshot.data == null || snapshot.data!.isEmpty) {
                    //   return Container(
                    //     child: Lottie.asset('android/assets/emptycart.json'),
                    //   );
                    // }
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

  Center buildCart(double screenWidth, HomeController controller) {
    return controller.cartItems.length == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset('android/assets/emptycart.json'),
                ),
                TextCustom(
                  theText: "لا يوجد شيء في السله",
                  fontSizeWidth: 25,
                  fontFamily: AppTextStyles.Almarai,
                  fontColor: AppColors.blackColor,
                  maxLines: 3,
                )
              ],
            ),
          )
        : Center(
            child: Column(
              children: [
                Container(
                  height: 400.h,
                  child: ListView.builder(
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        final productCart = controller.cartItems[index];
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
                                          urlTheImage: productCart.productImage
                                              .toString(),
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
                                                  theText:
                                                      "${productCart.productname}",
                                                  fontSizeWidth: 22,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontColor: AppColors
                                                      .blackColorsTypeOne),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: ContainerCustom(
                                                      theBorderRadius: 50,
                                                      heigthContainer: 30,
                                                      widthContainer: 30,
                                                      colorContainer: AppColors
                                                          .theAppColorYellow,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .add(index);
                                                          },
                                                          icon: Icon(
                                                            Icons.add,
                                                            size: 18,
                                                            color: AppColors
                                                                .blackColor,
                                                          )),
                                                    ),
                                                  ),
                                                  TextCustom(
                                                      theText:
                                                          "${productCart.quantityproduct}",
                                                      fontSizeWidth: 15,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      fontColor: AppColors
                                                          .blackColorsTypeOne),
                                                  Center(
                                                    child: ContainerCustom(
                                                      theBorderRadius: 50,
                                                      heigthContainer: 30,
                                                      widthContainer: 30,
                                                      colorContainer: AppColors
                                                          .theAppColorYellow,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .checkminus(
                                                                    context,
                                                                    index);
                                                          },
                                                          icon: Icon(
                                                            Icons.remove,
                                                            size: 18,
                                                            color: AppColors
                                                                .blackColor,
                                                          )),
                                                    ),
                                                  ),
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
                                                theText:
                                                    "${productCart.productPrice}",
                                                fontSizeWidth: 20,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontColor: AppColors
                                                    .blackColorsTypeOne),
                                            TextCustom(
                                                theText:
                                                    "${controller.multiplyprice(productCart.productPrice as double, productCart.quantityproduct as int)}",
                                                fontSizeWidth: 20,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontColor: AppColors
                                                    .blackColorsTypeOne)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.delete(index);
                                },
                                child: ContainerCustom(
                                  theBorderRadius: 50,
                                  heigthContainer: 25,
                                  widthContainer: 25,
                                  colorContainer:
                                      Color.fromARGB(255, 228, 38, 38),
                                  child: Text(
                                    "X",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                  child: Container(
                    height: 2.h,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
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
                            theText: "${controller.totalprice()}  رس",
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
                      )
                    ],
                  ),
                ),
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
                      theText: "شراء   ",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColor,
                      maxLines: 3,
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smoe/controllers/home_controller.dart';
import 'package:smoe/core/constant/app_text_styles.dart';
import 'package:smoe/core/constant/images_path.dart';

import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.goToHome();
    return Scaffold(
      backgroundColor: AppColors.theAppColorYellow,
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(
            ImagesPath.loadingAnimation,
            width: 999.w,
          ),
        ),
        PaddingCustom(
          theTop: 0,
          theBottom: 30,
          theLeft: 0,
          theRight: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextCustom(
              theText: "أنتظر قليلًا",
              fontSizeWidth: 20,
              fontFamily: AppTextStyles.Almarai,
              fontColor: AppColors.blackColor,
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class Locationpage extends StatelessWidget {
  const Locationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PaddingCustom(
                //  theTop: 30,
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: InkWell(
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
                              theText: " الموقع",
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
              height: 24.h,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(90, 78, 70, 70).withOpacity(0.5),
                    spreadRadius: -10, // spread radius
                    blurRadius: 20,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    //padding: EdgeInsets.only(left: 16, right: 16),
                    child: TextCustom(
                        theText: "البيت",
                        fontSizeWidth: 15,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.blackColorsTypeOne),
                  ),
                  Expanded(child: Container()),
                  TextCustom(
                      theText: "lang",
                      fontSizeWidth: 15,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.theAppColorYellow),
                  SizedBox(
                    width: 8,
                  ),
                  TextCustom(
                      theText: "late",
                      fontSizeWidth: 15,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.theAppColorYellow),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(90, 78, 70, 70).withOpacity(0.5),
                    spreadRadius: -10, // spread radius
                    blurRadius: 20,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    //padding: EdgeInsets.only(left: 16, right: 16),
                    child: TextCustom(
                        theText: "العمل",
                        fontSizeWidth: 15,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.blackColorsTypeOne),
                  ),
                  Expanded(child: Container()),
                  TextCustom(
                      theText: "lang",
                      fontSizeWidth: 15,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.theAppColorYellow),
                  SizedBox(
                    width: 8,
                  ),
                  TextCustom(
                      theText: "late",
                      fontSizeWidth: 15,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.theAppColorYellow),
                ],
              ),
            ),
            Expanded(child: Container()),
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
                  theText: "new location    ",
                  fontSizeWidth: 20,
                  fontFamily: AppTextStyles.Almarai,
                  fontColor: AppColors.blackColor,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

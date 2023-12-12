import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smoe/customWidgets/custom_container.dart';
import 'package:smoe/customWidgets/custom_text.dart';

import '../core/constant/app_text_styles.dart';
import '../core/constant/appcolors.dart';

// ignore: must_be_immutable
class CustomCachedNetworkImage extends StatelessWidget {
  String urlTheImage;
  final double width;
  final double height;
  final BoxFit boxFit;

  CustomCachedNetworkImage({
    super.key,
    required this.urlTheImage,
    required this.width,
    required this.height,
    required this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: width.w,
        height: height.h,
        fit: boxFit,
        imageUrl: ("${urlTheImage}"),
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: imageProvider,
                  fit: boxFit,
                ),
              ),
            ),
        placeholder: (context, url) => SizedBox(
            child: ContainerCustom(
                colorContainer: AppColors.theAppColorYellow,
                heigthContainer: height.h,
                widthContainer: width.w,
                child: TextCustom(
                    theText: "Smoe",
                    fontSizeWidth: 20,
                    fontFamily: AppTextStyles.Marhey,
                    fontColor: AppColors.blackColor))));
  }
}

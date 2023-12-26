import 'package:flutter/material.dart';

import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../customWidgets/custom_text.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            TextCustom(
              theText: "Smoe",
              fontSizeWidth: 30,
              fontFamily: AppTextStyles.Marhey,
              fontColor: AppColors.balckColorTypeThree,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
    );
  }
}

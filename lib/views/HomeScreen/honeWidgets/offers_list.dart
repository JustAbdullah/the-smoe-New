import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smoe/controllers/home_controller.dart';
import 'package:smoe/core/constant/appcolors.dart';
import 'package:smoe/core/data/offer.dart';
import 'package:smoe/customWidgets/custom_padding.dart';

import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';

class TheOffersList extends StatelessWidget {
  const TheOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    // Future<List<offer>> offersfuture =
    //     homeController.getDataOffersFromDatabase();
    homeController.onInit();

    return FutureBuilder<List<offer>>(
        future: homeController.getDataOffersFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final offers = snapshot.data!;
            return buildeoffers(offers);
          } else {
            return ContainerCustom(
                heigthContainer: 150,
                widthContainer: 900,
                colorContainer: AppColors.whiteColorTypeOne,
                theBorderRadius: 20,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return PaddingCustom(
                          theRight: 10,
                          theLeft: 10,
                          child: Shimmer.fromColors(
                              baseColor: Color.fromARGB(31, 83, 82, 82),
                              highlightColor: Colors.white,
                              enabled: true,
                              child: ContainerCustom(
                                  heigthContainer: 250,
                                  widthContainer: 200,
                                  colorContainer: AppColors.whiteColorTypeOne,
                                  theBorderRadius: 20,
                                  child: Center())));
                    }));
          }
        });
  }

  ContainerCustom buildeoffers(List<offer> offers) {
    return ContainerCustom(
        heigthContainer: 150,
        widthContainer: 900,
        colorContainer: AppColors.whiteColorTypeOne,
        theBorderRadius: 20,
        child: GetBuilder<HomeController>(
          builder: (tx) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                final oneoffer = offers[i];
                return PaddingCustom(
                    theRight: 10,
                    theLeft: 10,
                    child: ContainerCustom(
                        heigthContainer: 250,
                        widthContainer: 200,
                        colorContainer: AppColors.whiteColorTypeOne,
                        theBorderRadius: 20,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: CustomCachedNetworkImage(
                                  urlTheImage: oneoffer.img.toString(),
                                  width: 200,
                                  height: 250,
                                  boxFit: BoxFit.cover,
                                )),
                          ],
                        )));
              }),
        ));
  }
}

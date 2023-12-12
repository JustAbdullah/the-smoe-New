//import 'package:http/http.dart' as http;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe/core/class/class/crud.dart';
import 'package:smoe/linksapi.dart';
import 'package:smoe/views/HomeScreen/home_screen.dart';

import '../core/constant/images_path.dart';

class HomeController extends GetxController {
  final crud = Crud();

  final itemKey = GlobalKey();
  final controllerListViewOffers = ScrollController();

///////////////////Search Products,,,,,,,,,,////////////////////

  TextEditingController? nameSearchController;

//////////////////////////Show and hide operations Main and Sub Types,,,,,,////////////////

  RxInt theCountofShowingList = 0.obs;
  RxDouble theHeightOfContainer = 80.h.obs;
  RxBool showTheMainTypes = false.obs;
  RxBool showTheSubTypes = false.obs;

  RxString ImageMainType = ImagesPath.plus.obs;
  RxString ImageSubType = ImagesPath.plus.obs;
  RxDouble PaddingTheSubType = 50.0.obs;
  RxDouble PaddingTheProducts = 50.0.obs;

  chaneConditionMainTypes() {
    if (showTheMainTypes.value == false) {
      theCountofShowingList.value = theCountofShowingList.value + 1;
      showTheMainTypes.value = true;
      ImageMainType.value = ImagesPath.minus;

      controlTheSubTypesLocation();
    } else if (showTheMainTypes.value == true) {
      theCountofShowingList.value = theCountofShowingList.value - 1;
      showTheMainTypes.value = false;
      controlTheSubTypesLocation();
      ImageMainType.value = ImagesPath.plus;
    }
  }

  chaneConditionSubTypes() {
    if (showTheSubTypes.value == false) {
      theCountofShowingList.value = theCountofShowingList.value + 1;
      showTheSubTypes.value = true;
      controlTheSubTypesLocation();
      ImageSubType.value = ImagesPath.minus;
    } else if (showTheSubTypes.value == true) {
      theCountofShowingList.value = theCountofShowingList.value - 1;
      showTheSubTypes.value = false;
      controlTheSubTypesLocation();
      ImageSubType.value = ImagesPath.plus;
    }
  }

  controlTheSubTypesLocation() {
    if (theCountofShowingList.value == 2) {
      PaddingTheSubType.value = 150.0;
      PaddingTheProducts.value = 260.0;
    } else if (theCountofShowingList.value == 1) {
      PaddingTheSubType.value = 50.0;
      PaddingTheProducts.value = 160.0;
    } else {
      PaddingTheProducts.value = 50.0;
    }
  }

//////////////////////Get Data From DataBase..............................................//////////////////////////////
  getDataOffersFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.TheOffersData, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getDataMainTypesFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.TheMainTypes, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  getProductsFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.TheProducts, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  //////..........................................////////////////

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (controllerListViewOffers.hasClients) {
        controllerListViewOffers.animateTo(
            controllerListViewOffers.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        Timer.periodic(Duration(seconds: 1), (Timer timer) {
          update();
        });
      }
      super.onInit();
    });
  }

  goToHome() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      Get.offAll(HomeScreen());
    });
  }
}

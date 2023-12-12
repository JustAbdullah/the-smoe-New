import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/appservices.dart';

class ChangeLanguageToLocale extends GetxController {
  Locale? language;

  bool themechage = false;

  RxInt changeLangData = 1.obs;
  RxBool isChange = false.obs;
  AppServices appServices = Get.find();
  /*ThemeData appTheme = themeAraib;*/

  changeLang(String langcode) {
    // ignore: unused_local_variable
    Locale locale = Locale(langcode);

    appServices.sharedPreferences.setString("lang", langcode);

    langcode == "ar" ? themechage = true : themechage = false;

/* Get.changeTheme(appTheme);*/
    if (langcode == "ar") {
      appServices.sharedPreferences.setInt("langData", 1);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;

      Get.changeTheme;
      isChange.value = false;
      update();
    } else if (langcode == "en") {
      appServices.sharedPreferences.setInt("langData", 2);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;
      Get.changeTheme;
      isChange.value = true;
      update();
    } else {
      update();
      Get.changeTheme;
    }
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();

    String? sharedPrefLang = appServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = Locale("ar");
      appServices.sharedPreferences.setInt("langData", 1);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;
      Get.changeTheme;
      isChange.value = false;
    } else if (sharedPrefLang == "en") {
      language = Locale("en");

      appServices.sharedPreferences.setInt("langData", 2);
      changeLangData.value =
          appServices.sharedPreferences.getInt('langData') as int;
      Get.changeTheme;
      isChange.value = true;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}

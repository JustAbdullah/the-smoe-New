import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smoe/views/HomeScreen/home_screen.dart';

import 'core/constant/color_primary.dart';
import 'core/localization/changelanguage.dart';
import 'core/localization/translation.dart';
import 'core/services/appservices.dart';
import 'views/ProductsScreen/products_screen.dart';
import 'views/loadingScreen/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Stripe.publishableKey = ApiKeysStripe.Publishablekey;

  await initialServices();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

ChangeLanguageToLocale chagnelangcontroller = Get.put(ChangeLanguageToLocale());

class MyApp extends StatelessWidget {
  final width;
  const MyApp({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.restoreSystemUIOverlays();
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window.physicalSize.height;
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window.physicalSize.width;
    return GetMaterialApp(
      //  initialBinding: initBindings(),
      debugShowCheckedModeBanner: false,
      locale: chagnelangcontroller.language,
      translations: AppTranslation(),
      title: "Smoe",
      home: Scaffold(
          body: SafeArea(
              child: ScreenUtilInit(
                  designSize: Size(360, 690), child: LoadingScreen()))),
      theme: ThemeData(primarySwatch: ModeColor.mode),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(0.9, 0.9);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: child!);
      },
    );
  }
}

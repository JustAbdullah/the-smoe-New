//import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smoe/core/class/class/crud.dart';
import 'package:smoe/core/data/model/products.dart';
import 'package:smoe/linksapi.dart';
import 'package:smoe/views/HomeScreen/home_screen.dart';
import 'package:http/http.dart' as http;
import '../core/constant/app_text_styles.dart';

import '../core/constant/images_path.dart';
import '../core/data/bill.dart';
import '../core/data/bill_details.dart';
import '../core/data/maintype.dart';
import '../core/data/model/cart.dart';
import '../core/data/offer.dart';
import '../core/data/subtype.dart';
import '../core/services/appservices.dart';

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
  Future<List<offer>> getDataOffersFromDatabase() async {
    //var response = await crud.postRequest(AppLinksApi.TheOffersData, {});
    var response =
        await http.post(Uri.parse(AppLinksApi.TheOffersData), body: {});

    final List body = json.decode(response.body)["data"];
    return body.map((e) => offer.fromJson(e)).toList();
  }

  // getDataMainTypesFromDatabase() async {
  //   var response = await crud.postRequest(AppLinksApi.TheMainTypes, {});

  //   if (response['status'] == "success") {
  //   } else {}
  //   return response;
  // }

  getProductsFromDatabase() async {
    var response = await crud.postRequest(AppLinksApi.TheProducts, {});

    if (response['status'] == "success") {
    } else {}
    return response;
  }

  //////..........................................////////////////

  @override
  void onInit() {
    super.onInit();

    if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
      displayIsHavaAccount.value =
          appServices.sharedPreferences.getInt('isHaveAccount') as int;

      displayUserName.value =
          appServices.sharedPreferences.getString('userName') as String;
      displayUserId.value =
          appServices.sharedPreferences.getString('userID') as String;

      displayUserPhone.value =
          appServices.sharedPreferences.getString('phone') as String;

      getDataUser(displayUserName.value.toString());
    }
  }

  goToHome() async {
    await Future.delayed(const Duration(seconds: 5), () async {
      Get.offAll(HomeScreen());
    });
  }

  //////////////////////////////////////////////////////
///////////////// Product Detale //////////////////
/////////////////////////////////////////////////////

  Future<Products> getProductDetaleFromDatabase() async {
    var data = {
      'product_id': '4',
      'language': 'AR',
    };
    // Encode the data as JSON
    var jsonData = jsonEncode(data);
    var response = await http.post(
      Uri.parse(AppLinksApi.TheProductDetale),
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
    print("ssssssssssssssss");
    print(response.body);
    final body = json.decode(response.body)["data"];
    return Products.fromJson(body);
  }
//////////////////////////////////////////////////////
/////////////////end  product detale //////////////////
/////////////////////////////////////////////////////

//////////////////////////////////////////////////////
/////////////////  Cart Page //////////////////
/////////////////////////////////////////////////////

  late Future<List<Cart>> cartItemsFuture;
  late List<Cart> cartItems;

  Future<List<Cart>> getDataProductCartFromDatabase() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheProductCart), body: {});

    final List body = json.decode(response.body)["data"];
    print(body);
    return body.map((e) => Cart.fromJson(e)).toList();
  }

  insertProductCart(String productid) async {
    var data = {
      'user_id': 1,
      'product_id': productid,
    };
    var jsonData = jsonEncode(data);
    var response = await http.post(
      Uri.parse(AppLinksApi.InsertProductCart),
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
  }

  edirQuantitytoDB(int index) async {
    var data = {
      'user_id': cartItems[index].userid,
      'product_id': cartItems[index].productId,
      'quantity': cartItems[index].quantityproduct
    };
    var jsonData = jsonEncode(data);
    var response = await http.post(
      Uri.parse(AppLinksApi.EditeProductCart),
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
  }

  deleteproductfromDB(int index) async {
    var data = {
      'user_id': cartItems[index].userid,
      'product_id': cartItems[index].productId,
    };
    var jsonData = jsonEncode(data);
    var response = await http.post(
      Uri.parse(AppLinksApi.DeleteProductCart),
      body: jsonData,
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
  }

  add(int index) {
    cartItems[index].quantityproduct = cartItems[index].quantityproduct! + 1;
    edirQuantitytoDB(index);
    update();
  }

  checkminus(BuildContext context, int index) {
    if (cartItems[index].quantityproduct == 1) {
      Get.defaultDialog(
          title: "تنبيه",
          titleStyle: TextStyle(
              fontFamily: AppTextStyles.Almarai,
              color: const Color.fromARGB(255, 252, 5, 5),
              fontWeight: FontWeight.bold),
          middleText:
              "اقل كميه للطلب هي عنصر واحد لحذف العنصر اضغط على ايقونه الحذف اعلا يمين العنصر");
    } else {
      minse(index);
    }
  }

  minse(int index) {
    cartItems[index].quantityproduct = cartItems[index].quantityproduct! - 1;
    edirQuantitytoDB(index);
    update();
  }

  delete(int index) {
    deleteproductfromDB(index);
    cartItems.removeAt(index);
    update();
  }

  void setCartItems(List<Cart> items) {
    cartItems = items;
  }

  double multiplyprice(double price, int quantity) {
    return price * quantity;
  }

  double totalprice() {
    double total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += multiplyprice(
          cartItems[i].productPrice!, cartItems[i].quantityproduct!);
    }
    return total;
  }
  //////////////////////////////////////////////////////
///////////////// End Cart Page //////////////////
/////////////////////////////////////////////////////
  //////////////////////////////////////////////////////
///////////////// loda main type //////////////////
/////////////////////////////////////////////////////

  late Future<List<maintype>> maintypeItemsFuture;
  List<maintype> maintypeItems = [];
  late Future<List<subtype>> subtypeItemsFuture;
  List<subtype> subtypeItems = [];

  checktypes() {
    maintypeItems.isEmpty
        ? {
            maintypeItemsFuture = getDataMainTypesFromDatabase(),
          }
        : nothing();
    subtypeItems.isEmpty
        ? {
            subtypeItemsFuture = getDatasubTypesFromDatabase(),
          }
        : nothing();
  }

  nothing() {}
  void setmaintypeItems(List<maintype> items) {
    maintypeItems = items;
  }

  Future<List<maintype>> getDataMainTypesFromDatabase() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheMainTypes), body: {});
    final List body = json.decode(response.body)["data"];
    print("loooooode main type data ");
    return body.map((e) => maintype.fromJson(e)).toList();
  }

  Future<List<subtype>> getDatasubTypesFromDatabase() async {
    var response =
        await http.post(Uri.parse(AppLinksApi.TheSubTypes), body: {});
    final List body = json.decode(response.body)["data"];
    print("loooooode sub type data ");
    return body.map((e) => subtype.fromJson(e)).toList();
  }

  void setsubtypeItems(List<subtype> items) {
    subtypeItems = items;
  }

  ///
  ///
  /// //////////////////////////////////////////////////////
///////////////// bill //////////////////
/////////////////////////////////////////////////////
  /// //////////////////////////////////////////////////////

  Future<List<Bill>> getbillsFromDatabase() async {
    var data = {
      'user_id': '3',
      'language': 'AR',
    };
    var jsonData = jsonEncode(data);
    var response = await http.post(
      Uri.parse(AppLinksApi.getBills),
      body: jsonData,
    );
    print(response.body);
    final List body = json.decode(response.body)["data"];
    print("loooooode sub type data ");
    return body.map((e) => Bill.fromJson(e)).toList();
  }

  late List<Bill> billsItems;
  void setbillsItems(List<Bill> items) {
    billsItems = items;
  }

///////////////// end bill //////////////////
/////////////////////////////////////////////////////
////////////////////  bill details //////////////////
/////////////////////////////////////////////////////
  Future<List<billDEtail>> getbillDetailsFromDatabase() async {
    var data = {
      'bill_id': '3',
      'language': 'AR',
    };
    var jsonData = jsonEncode(data);
    var response = await http.post(
      Uri.parse(AppLinksApi.getBillDetails),
      body: jsonData,
    );
    print(response.body);
    final List body = json.decode(response.body)["data"];
    print("loooooode sub type data ");
    return body.map((e) => billDEtail.fromJson(e)).toList();
  }

/////////////////////// End bill details //////////////////
/////////////////////////////////////////////////////

  //////////////////////////////////////The Auth/////////////////////
  AppServices appServices = Get.find();

////////SignUp/////////////////
  GlobalKey<FormState> formSignPhoneAndName = GlobalKey<FormState>();
  GlobalKey<FormState> formSignPassword = GlobalKey<FormState>();

  RxBool isLoadingTheScreenSignUp = false.obs;
  RxBool isAddTheUser = false.obs;
  RxBool isErrorAboutAddTheUser = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String nameSignUp = "";
  String passwordSignUp = "";
  String phoneSignUp = "";

  waitScreenAuthSignUp() async {
    var formKeyData = formSignPhoneAndName.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenSignUp.value = true;
      Future.delayed(const Duration(seconds: 4), () async {
        isLoadingTheScreenSignUp.value = false;
        isAddTheUser.value = true;
      });
    }
  }

  cleanWaitScreenAuthSignUp() {
    isLoadingTheScreenSignUp.value = false;
    isAddTheUser.value = false;
  }

  signUpAccounts(
    String nameUSerNew,
    String password,
    String phone,
  ) async {
    var formKeyData = formSignPassword.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenSignUp.value = true;
      Future.delayed(const Duration(seconds: 3), () async {
        var response = await crud.postRequest(AppLinksApi.signUp, {
          'user_name': nameUSerNew.toString(),
          'user_password': password.toString(),
          'phone': phone.toString(),
        });
///////
        if (response['status'] == "success") {
          getDataUser(nameUSerNew.toString());
          isLoadingTheScreenSignUp.value = false;
          isAddTheUser.value = true;
        } else {
          isLoadingTheScreenSignUp.value = false;
          isErrorAboutAddTheUser.value = true;
        }

        return response;
      });
    }
  }

  cleanTheSignUp() {
    isLoadingTheScreenSignUp.value = false;
    isAddTheUser.value = false;
    isErrorAboutAddTheUser.value = false;
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    nameSignUp = "";
    passwordSignUp = "";
    phoneSignUp = "";
  }

  ////////////Login//////////////
  GlobalKey<FormState> formLogin = GlobalKey<FormState>();
  String nameLogin = "";
  String passwordLogin = "";
  TextEditingController nameControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  RxBool isLoadingTheScreenLogin = false.obs;
  RxBool isTheUserEnterTheRealyDataLogin = false.obs;
  RxBool isErrorAboutLoginTheUser = false.obs;

  loginAccounts(String nameUSerNew, String password) async {
    var formKeyData = formLogin.currentState;
    if (formKeyData!.validate()) {
      isLoadingTheScreenLogin.value = true;
      Future.delayed(const Duration(seconds: 3), () async {
        var response = await crud.postRequest(AppLinksApi.Login, {
          'user_name': nameUSerNew.toString(),
          'user_password': password.toString(),
        });
///////
        if (response['status'] == "success") {
          getDataUser(nameUSerNew.toString());

          isLoadingTheScreenLogin.value = false;
          isTheUserEnterTheRealyDataLogin.value = true;
        } else {
          isErrorAboutLoginTheUser.value = true;
        }

        return response;
      });
    }
  }

  cleanTheLogin() {
    nameLogin = "";
    passwordLogin = "";
    nameControllerLogin.clear();
    passwordControllerLogin.clear();
    isLoadingTheScreenLogin.value = false;
    isTheUserEnterTheRealyDataLogin.value = false;
    isErrorAboutLoginTheUser.value = false;
  }

///////////Get Data User////////////////

  goToHomeLoginSignUp() {
    Get.to(HomeScreen());
  }

  String userID = "";
  String userName = "";
  String userPhone = "";

  getDataUser(String name) async {
    var response = await crud.postRequest(AppLinksApi.getDataUser, {
      'user_name': name.toString(),
    });

    if (response['status'] == "success") {
      userID = response['data'][0]['user_id'].toString();
      userName = response['data'][0]['user_name'].toString();
      userPhone = response['data'][0]['phone'].toString();
      appServices.sharedPreferences.setInt('isHaveAccount', 1);
      appServices.sharedPreferences.setString('userName', userName);
      appServices.sharedPreferences.setString('userID', userID);
      appServices.sharedPreferences.setString('phone', userPhone);

      await Future.delayed(const Duration(seconds: 5), () async {
        onInit();
      });
    } else {}
    return response;
  }

/////////DisplayData////////////////////
  RxString displayUserName = "".obs;
  RxString displayUserId = "".obs;
  RxInt displayIsHavaAccount = 0.obs;
  RxString displayUserPhone = "".obs;
  RxString displayUserEligibilityAdd = "".obs;
  RxBool isUserNotHaveAccount = false.obs;
}

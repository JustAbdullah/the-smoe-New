import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constant/appcolors.dart';
import 'OrdersScreen/orders.dart';
import 'locationScreen/location.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          //alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                  child: Text(
                "الاعدادات",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              )),
              SizedBox(
                height: 16,
              ),
              Text(
                "Ail Mohammed",
                style: TextStyle(
                    color: AppColors.theAppColorYellow,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "776655443",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              Container(
                width: 300.w,
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 16,
              ),
              const Text(
                "الحساب",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              ////////////////////////////////////////////////

              LebalSetting(
                  "تعديل الملف الشخصي", Icons.person_pin, Locationpage()),
              LebalSetting("الطلبات", Icons.apps_sharp, Orders()),
              LebalSetting(
                  "مكان التسليم", Icons.location_on_outlined, Locationpage()),
              LebalSetting("Edite Profile", Icons.person_pin, Locationpage()),
              SizedBox(
                height: 16,
              ),
              const Text(
                "General",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              LebalSetting(
                  "support", Icons.contact_support_outlined, Locationpage()),
              LebalSetting(
                  "Terms of service", Icons.beenhere_sharp, Locationpage()),
            ],
          ),
        ),
      ),
    );
  }

  Column LebalSetting(String lebal, IconData icon, Widget widget) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            Get.to(widget);
          },
          child: Container(
            height: 50,
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
                Icon(
                  icon,
                  size: 30,
                  color: AppColors.theAppColorYellow,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    lebal,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 30,
                  color: AppColors.theAppColorYellow,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

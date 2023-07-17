import 'package:code_lab/controllers/home_controller.dart';
import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/screens/homeScreens/home_screen.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'brands_screen.dart';
import 'profile_screen.dart';

class MainHome extends StatefulWidget {
  MainHome({super.key, this.currentpage});
  int? currentpage;
  @override
  State<MainHome> createState() => _MainHomeState();
}

int currentIndex = 0;
List pages = [const HomeScreen(), const BrandsScreen(), const ProfileScreen()];

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    // final prefcontroller = Get.put(LocalStorage());
    // final logincontroller = Get.put(LoginController());
    final controller = Get.put(HomeController());
    @override
    initState() {
      widget.currentpage = currentIndex;
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            selectedItemColor: primaryColor,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                  ),
                  label: "home".tr),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.category,
                  ),
                  label: "brands".tr),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.person,
                  ),
                  label: "profile".tr),
            ]),
        body: pages[currentIndex]);
  }
}

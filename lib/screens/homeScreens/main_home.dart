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
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

int currentIndex = 0;
List pages = [const HomeScreen(), const BrandsScreen(), const ProfileScreen()];

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    final prefcontroller = Get.put(LocalStorage());
    final logincontroller = Get.put(LoginController());
    final controller = Get.put(HomeController());
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
              print(value);
              print(currentIndex);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                  ),
                  label: "Brands"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Profile"),
            ]),
        body: pages[currentIndex]);
  }
}

import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/theme/thems_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locales/messages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Lab',
      theme: appThemeData,
      getPages: AppPages.pages,
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'UK'),
    );
  }
}

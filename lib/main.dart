import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/theme/thems_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bindings.dart';
import 'locales/messages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print(Get.width);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RootBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Code Lab',
      color: primaryColor,
      themeMode: ThemeMode.light,
      theme: ThemeDataOfApp().lightTheme,
      getPages: AppPages.pages,
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'UK'),
    );
  }
}

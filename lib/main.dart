import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/theme/colors.dart';
import 'package:code_lab/theme/thems_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bindings.dart';
import 'locales/messages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// final MoEngageFlutter _moengagePlugin = MoEngageFlutter(
//   "com.example.code_lab",
// );
// Future<void> message(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.toString());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging.onBackgroundMessage(message);
  // String? token = await FirebaseMessaging.instance.getToken();
  // _moengagePlugin.initialise();
  // _moengagePlugin.passFCMPushToken(token!);
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

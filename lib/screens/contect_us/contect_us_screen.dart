import 'package:code_lab/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../color_constant.dart';
import '../../controllers/contectUsController.dart';
import '../../theme/colors.dart';

class ContectUsScreen extends StatelessWidget {
  const ContectUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ContectUsController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            LineAwesomeIcons.angle_left,
            color: kDefaultIconDarkColor,
          ),
        ),
        backgroundColor: kWhite,
        elevation: 0.51,
        title: Text(
          "contact_us".tr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            ProfileMenuWidget(
              title: "email_us".tr,
              icon: LineAwesomeIcons.mail_bulk,
              endIcon: true,
              trailing: Text(
                "support@codatak.me",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPress: () {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'support@codatak.me',
                  query: 'subject=This is the subject&body=This is body',
                );
                // final url = params.toString();
                launchUrl(params);
              },
            ),
            ProfileMenuWidget(
                title: "feedback".tr,
                icon: LineAwesomeIcons.blogger_b,
                onPress: () {
                  Get.toNamed(Routes.FEEDBACK);
                }),
            ProfileMenuWidget(
                title: "tiktok".tr,
                icon: LineAwesomeIcons.twitter,
                trailing: Text(
                  "@codatak",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                endIcon: true,
                onPress: () {
                  final params = Uri.parse(
                      'https://www.tiktok.com/@codatak.app?_t=8eSGmgtjEfQ&_r=1');
                  //  https://www.tiktok.com/@codatak.app?_t=8eSGmgtjEfQ&_r=1
                  launchUrl(params,
                      mode: LaunchMode.externalNonBrowserApplication);
                }),
            ProfileMenuWidget(
                title: "instagram".tr,
                icon: LineAwesomeIcons.instagram,
                trailing: Text(
                  "@codatak",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                endIcon: true,
                onPress: () {
                  final params = Uri.parse(
                    'https://instagram.com/codatak.app?igshid=NTc4MTIwNjQ2YQ==',
                  );
                  launchUrl(params,
                      mode: LaunchMode.externalNonBrowserApplication);
                }),
            ProfileMenuWidget(
                title: "snapchat".tr,
                icon: LineAwesomeIcons.snapchat,
                trailing: Text(
                  "@codatak",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                endIcon: true,
                onPress: () {
                  final params = Uri.parse('https://t.snapchat.com/mf3bCgWf');
                  //https://t.snapchat.com/mf3bCgWf
                  launchUrl(params,
                      mode: LaunchMode.externalNonBrowserApplication);
                }),
            Divider()
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = false,
    this.trailing,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.black : Colors.black;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorConstant.yellow700,
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      trailing: endIcon == false
          ? Container(
              width: 30,
              height: 30,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(100),
              //   color: ColorConstant.yellow700,
              // ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.black))
          : trailing,
    );
  }
}

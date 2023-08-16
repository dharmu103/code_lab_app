import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_lab/color_constant.dart';
import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/localStorage/pref.dart';
import 'package:code_lab/models/user_model.dart';
import 'package:code_lab/routes/pages.dart';
import 'package:code_lab/services/remote_services.dart';
import 'package:code_lab/widgets/dailogs/option_sheet.dart';
import 'package:code_lab/widgets/dailogs/sheets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/home_controller.dart';
import '../../theme/colors.dart';

Future<void> launchUrlProfilePage(url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    print("object");
    throw Exception('Could not launch $url');
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    CroppedFile? selectedImage;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   //  onPressed: () => Get.back(),
          //     icon: const Icon(LineAwesomeIcons.angle_left)),
          backgroundColor: kWhite,
          elevation: 0.51,

          title: Text(
            "profile".tr,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              children: [
                GetBuilder<HomeController>(
                  init: HomeController(),
                  initState: (_) {},
                  builder: (_) {
                    if (RemoteService.user.profile?.email == null) {
                      return Container();
                    }
                    return Text(
                      "referral_earning".tr +
                          ': ${_.referDetail?.referraldetails?.referralpoints ?? 0}',
                      style: TextStyle(fontSize: 16, color: primaryColor)
                          .copyWith(),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.lightBlue.shade300.withOpacity(.08),
                //     Colors.lightBlue.shade100.withOpacity(0.8)
                //   ],
                // ),
                ),
            // padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Row(
                //     children: [
                //       Text(
                //         "profile".tr,
                //         style: const TextStyle(
                //             fontSize: 25, fontWeight: FontWeight.w500),
                //       ),
                //       Spacer(),
                //       GetBuilder<HomeController>(
                //         init: HomeController(),
                //         initState: (_) {},
                //         builder: (_) {
                //           return Text(
                //             "Referral Earning : ${_.referDetail?.referraldetails?.referralpoints ?? 0}",
                //             style: TextStyle(fontSize: 16, color: Colors.blue)
                //                 .copyWith(),
                //           );
                //         },
                //       )
                //     ],
                //   ),
                // ),
                // Divider(),

                /// -- IMAGE
                ///

                GetBuilder<LocalStorage>(builder: (_) {
                  if (LocalStorage.accessToken == "") {
                    return Container();
                  }
                  return Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: GetBuilder<LoginController>(
                          init: LoginController(),
                          initState: (_) {},
                          builder: (_) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child:
                                    RemoteService.user.profile?.profileImage ==
                                            null
                                        ? const Image(
                                            image: AssetImage(
                                                "assets/images/profile.png"))
                                        : Image(
                                            image: CachedNetworkImageProvider(
                                                _.user.profile?.profileImage ??
                                                    "")));
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            var res = await addPictureSheet(context, false);
                            if (res != null) {
                              selectedImage = res;

                              String response =
                                  await controller.uploadProfileImage({
                                'image': File(selectedImage!.path),
                              });
                              print(res);
                              print(response);
                              if (response == "Success") {
                                //done
                                Get.back();
                                selectedImage = null;
                                controller
                                    .getProfile(); // userProfileController.getUserDetails();
                                //  print("++++++++++++++++");
                                //   print(
                                //    _.userProfile.value.data!.profileImage!,
                                //  );
                              } else {
                                //error
                                Get.back();

                                Get.snackbar('Failed', response);
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              LineAwesomeIcons.alternate_pencil,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 10),
                GetBuilder<LocalStorage>(builder: (_) {
                  if (LocalStorage.accessToken == "") {
                    return Container();
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(RemoteService.user.profile?.firstName ?? " ",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  );
                }),
                GetBuilder<LocalStorage>(builder: (_) {
                  if (LocalStorage.accessToken == "") {
                    return Container();
                  }
                  return Text(
                    RemoteService.user.profile?.email ?? "",
                  );
                }),
                // Text("ProfileSubHeading",
                //     style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(height: 20),

                /// -- BUTTON
                GetBuilder<LocalStorage>(
                  builder: (_) => LocalStorage.accessToken == ""
                      ? SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: Text("login".tr,
                                style: const TextStyle(color: Colors.white)),
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(height: 30),
                GetBuilder<LocalStorage>(builder: (_) {
                  if (LocalStorage.accessToken == "") {
                    return Container();
                  }
                  return Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: controller.user.profile?.emailVerified == true
                        ? Container(
                            // child: Text(controller.user.profile!.emailVerified
                            //     .toString()),
                            )
                        : Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Email verification Pending",
                                style: TextStyle(
                                    color: kWhite, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              TextButton(
                                  onPressed: () {
                                    controller.sendEmailOtp({
                                      "email": controller.user.profile!.email
                                    });
                                  },
                                  child: Text(
                                    "Verify Here",
                                    style: TextStyle(
                                        color: kWhite,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  )),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                  );
                }),
                const Divider(),
                const SizedBox(height: 10),

                /// -- MENU

                ProfileMenuWidget(
                  title: "language".tr,
                  icon: LineAwesomeIcons.language,
                  onPress: () {
                    optionSheet(context, ["English", "Arabic"], 'language');
                  },
                ),
                GetBuilder<HomeController>(
                  builder: (_) {
                    return ProfileMenuWidget(
                        title: "country".tr,
                        icon: LineAwesomeIcons.confluence,
                        onPress: () {
                          print(_.countryList?.countries?.length);
                          optionSheetCountry(
                              context,
                              _.countryList?.countries
                                  ?.map((e) => e.name)
                                  .toList(),
                              'country');
                        });
                  },
                ),
                ProfileMenuWidget(
                    title: "contact_us".tr,
                    icon: LineAwesomeIcons.facebook_messenger,
                    onPress: () {
                      Get.toNamed(Routes.CONTECTUS);
                    }),
                ProfileMenuWidget(
                    title: "rate_us".tr,
                    icon: LineAwesomeIcons.raised_fist,
                    onPress: () {
                      launchUrlProfilePage(
                          "https://play.google.com/store/apps/details?id=com.ludo.king&hl=en-IN");
                    }),
                GetBuilder<HomeController>(
                  init: HomeController(),
                  initState: (_) {},
                  builder: (_) {
                    if (RemoteService.user.profile?.email == null ||
                        LocalStorage.country != "UAE") {
                      return Container(
                          // child: Text(LocalStorage.country.toString()),
                          );
                    }
                    return ProfileMenuWidget(
                        title: "refer_and_earn".tr,
                        icon: LineAwesomeIcons.share,
                        onPress: () async {
                          Get.defaultDialog(
                              titlePadding: EdgeInsets.only(top: 20),
                              title: "refer_and_earn".tr,
                              content: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10),
                                child: Text(LocalStorage.language == "English"
                                    ? "Earn 10 points for every successful friend installation referred by you in gulf countries.Once you accumulate 100 points, simply email us a screenshot of your profile at support@codatak.me to claim your rewards.Start referring today and unlock exciting benefits!"
                                    : '''"اكسب 10 نقاط مقابل كل صديق يقوم بتثبيت التطبيق بنجاح بناءً على إحالتك في دول الخليج.
بمجرد أن تجمع 100 نقطة، ببساطة أرسل لنا صورة لملفك الشخصي عبر البريد الإلكتروني على support@codatak.me لاستلام مكافآتك"'''),
                              ),
                              cancel: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("cancel".tr)),
                              confirm: ElevatedButton(
                                  onPressed: () async {
                                    await _.getReferDetails();
                                    Share.share(
                                        LocalStorage.language == "English"
                                            ? "You've got to check it out! Simply download the FREE app *Codatak* using my referral code   *${_.referDetail?.referraldetails?.referralcode}* , and you'll unlock access to exclusive discount codes and deals from top brands, restaurants, and all the best shopping spots!  ${_.referDetail?.referraldetails?.referrallink} , "
                                            : ''' "لا يفوتك! قم بتنزيل التطبيق المجاني كوداتك باستخدام كود الإحالة الخاص بي *${_.referDetail?.referraldetails?.referralcode}*  وستحصل على أكواد خصومات حصرية وصفقات من أفضل العلامات التجارية والمطاعم وأفضل أماكن التسوق!" ${_.referDetail?.referraldetails?.referrallink}''',
                                        subject: 'Look what I made!');
                                  },
                                  child: Text("share".tr)));
                        });
                  },
                ),
                // Obx(() => SwitchListTile(
                //       value: LocalStorage().notification.value,
                //       secondary: Container(
                //           width: 40,
                //           height: 40,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(100),
                //             color: ColorConstant.yellow700,
                //           ),
                //           child: Icon(
                //             Icons.notifications_none_outlined,
                //             color: Colors.black,
                //           )),
                //       title: const Text('Notifications',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 14)),
                //       onChanged: (bool? value) {
                //         //  changeNotification()
                //       },
                //     )),
                const Divider(),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                // ProfileMenuWidget(
                //     title: "Information",
                //     icon: LineAwesomeIcons.info,
                //     onPress: () {}),
                GetBuilder<LocalStorage>(builder: (_) {
                  if (LocalStorage.accessToken == "") {
                    return Container();
                  }
                  return ProfileMenuWidget(
                      title: "logout".tr,
                      icon: LineAwesomeIcons.alternate_sign_out,
                      textColor: Colors.red,
                      endIcon: false,
                      onPress: () {
                        Get.defaultDialog(
                            title: "logout".tr,
                            content: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text("are_you_sure".tr),
                            ),
                            cancel: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("cancel".tr)),
                            confirm: ElevatedButton(
                                onPressed: () async {
                                  Get.back();
                                  final pref =
                                      await SharedPreferences.getInstance();
                                  // pref.clear();
                                  pref.setString("accessToken", "");
                                  RemoteService.user.profile =
                                      UserModel().profile;
                                  Get.snackbar("logout".tr, "successfully".tr,
                                      backgroundColor: Colors.red,
                                      colorText: kWhite);
                                  Get.find<LocalStorage>().setAccessToken();
                                  Get.find<LoginController>().logout();

                                  // Get.toNamed(Routes.INITIAL);
                                },
                                child: Text("ok".tr)));
                        // Get.defaultDialog(
                        //   title: "LOGOUT",
                        //   titleStyle: const TextStyle(fontSize: 20),
                        // content: const Padding(
                        //   padding: EdgeInsets.symmetric(vertical: 15.0),
                        //   child: Text("Are you sure, you want to Logout?"),
                        // ),
                        //   confirm: Expanded(
                        //     child: ElevatedButton(
                        //       //   onPressed: () => AuthenticationRepository.instance.logout(),
                        //       style: ElevatedButton.styleFrom(
                        //           backgroundColor: Colors.redAccent,
                        //           side: BorderSide.none),
                        //       onPressed: () async {
                        //         final pref = await SharedPreferences.getInstance();
                        //         pref.clear();
                        //         Get.find<HomeController>().setAccessToken();
                        //         Get.back();
                        //         Get.snackbar("Logout", "Logout successful");
                        //         // Get.toNamed(Routes.INITIAL);
                        //       },
                        //       child: const Text("Yes"),
                        //     ),
                        //   ),
                        //   cancel: OutlinedButton(
                        //       onPressed: () => Get.back(), child: const Text("No")),
                        // );
                      });
                }),
              ],
            ),
          ),
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
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

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
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(100),
              //   color: ColorConstant.yellow700,
              // ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.black))
          : null,
    );
  }
}

import 'package:code_lab/controllers/login_controller.dart';
import 'package:code_lab/widgets/dailogs/sheets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    CroppedFile? selectedImage;
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   //  onPressed: () => Get.back(),
        //     icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text(
          "Profile",
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage("assets/images/profile.png"))),
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
                            'image': selectedImage,
                          });

                          if (response.isEmpty) {
                            //done
                            Get.back();
                            selectedImage = null;

                            // userProfileController.getUserDetails();
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
              ),
              const SizedBox(height: 10),
              Text("Danial Sams",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Text("ProfileSubHeading",
              //     style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      //    backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("EditProfile",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              // ProfileMenuWidget(
              //     title: "Settings",
              //     icon: LineAwesomeIcons.cog,
              //     onPress: () {}),
              ProfileMenuWidget(
                  title: "Rate Us",
                  icon: LineAwesomeIcons.raised_fist,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Refer and Earn",
                  icon: LineAwesomeIcons.share,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                        title: "Logout",
                        content: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text("Are you sure, you want to Logout?"),
                        ),
                        cancel: ElevatedButton(
                            onPressed: () {}, child: Text("Cancle")),
                        confirm: ElevatedButton(
                            onPressed: () async {
                              final pref =
                                  await SharedPreferences.getInstance();
                              pref.clear();
                              Get.back();
                              Get.snackbar("Logout", "Successfully");
                              // Get.toNamed(Routes.INITIAL);
                            },
                            child: Text("Ok")));
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
                  }),
            ],
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
    var iconColor = isDark ? Colors.indigo : Colors.indigo;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

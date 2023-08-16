import 'dart:math';

import 'package:code_lab/controllers/contectUsController.dart';
import 'package:code_lab/widgets/buttons/primary_button.dart';
import 'package:code_lab/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../theme/colors.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String title = "";
  @override
  Widget build(BuildContext context) {
    final c = Get.find<ContectUsController>();
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController messageController = TextEditingController();
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
          "feedback".tr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  // height: kTextTabBarHeight,
                  child: DropdownButtonFormField(
                      // validator: (value) {
                      //   if (value == "") {
                      //     return "Please Select Subject Type.";
                      //   }
                      // },
                      // padding: EdgeInsets.all(10),
                      isDense: true,
                      decoration: InputDecoration(
                          hintText: "feedback".tr,
                          filled: true,
                          fillColor: primaryColor.withOpacity(0.1),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12))),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "inquiry".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: "Inquiry",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "complaint".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: "Complaint",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "suggestion".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: "Suggestion",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Other".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: "Other",
                        )
                      ],
                      onChanged: (v) {
                        title = v!;
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                textfields(nameController, "your_name".tr, (v) {
                  if (GetUtils.isLengthLessThan(v, 3)) {
                    return "Enter a valid name";
                  }
                  ;
                }),
                SizedBox(
                  height: 20,
                ),
                textfields(emailController, "email_id".tr, (v) {
                  if (!GetUtils.isEmail(v)) {
                    return "Please Enter a valid emai.";
                  }
                  ;
                }),
                SizedBox(
                  height: 20,
                ),
                textfields(mobileController, "mobile_optional".tr, (v) {}),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: messageController,
                  minLines: 10,
                  maxLines: 15,
                  validator: (v) {
                    if (v.toString() == 'null' || v == "") {
                      return "Enter message.";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "your_msg".tr,
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.1),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<ContectUsController>(
                  init: ContectUsController(),
                  initState: (_) {},
                  builder: (_) {
                    return PrimaryButton(
                      text: "submit".tr,
                      state: _.btnState,
                      onpress: () async {
                        if (title != "") {
                          if (_formKey.currentState!.validate()) {
                            var res = await c.sendForm({
                              "name": nameController.text,
                              "email": emailController.text,
                              "title": title,
                              "mobile": mobileController.text,
                              "message": messageController.text
                            });
                            if (res == "Success") {
                              Get.snackbar("Successful", "Feedback Sent.",
                                  colorText: kWhite,
                                  backgroundColor: Colors.green);
                              _formKey.currentState?.reset();
                            } else {
                              Get.snackbar("Error", "Feedback Not Sent",
                                  colorText: kWhite,
                                  backgroundColor: Colors.red);
                            }
                          }
                        } else {
                          Get.snackbar("Error", "Please Select Subject.",
                              colorText: kWhite, backgroundColor: Colors.red);
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

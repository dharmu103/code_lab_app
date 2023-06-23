import 'package:code_lab/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget passwordtext(controller, hint, validator, {bool hidePassword = false}) {
  return GetBuilder<LoginController>(
    builder: (_) {
      return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: _.hidePassword,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor:  Colors.indigoAccent.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
            
          ),
          suffixIcon: GetBuilder<LoginController>(
            builder: (_) {
              return IconButton(icon:const Icon(Icons.visibility) ,onPressed:() => _.showPassword(),);
            }
          )
        ),
      );
    }
  );
}
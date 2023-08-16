import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';

Widget textfields(controller, hint, validator) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText:
        hint == 'Password' || hint == "Confirm-Password" ? true : false,
    decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: primaryColor.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12))),
  );
}

import 'package:flutter/material.dart';

Widget textfields(controller, hint, validator) {
  return TextFormField(
    controller: controller,
    validator: validator,
    decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.indigoAccent.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12))),
  );
}

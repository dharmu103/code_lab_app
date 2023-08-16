import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ThemeDataOfApp {
  // ThemeDataOfApp({
  //   required Function() getTheme,
  // });

  ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    textTheme: GoogleFonts.tajawalTextTheme(),
    primaryColorLight: primaryColor,
    // useMaterial3: true,
  );
}

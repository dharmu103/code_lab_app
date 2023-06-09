import 'package:code_lab/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ThemeDataOfApp {
  ThemeDataOfApp({
    required Function() getTheme,
  });

  ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
  );
  ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: primaryColor.withOpacity(0.01),
  );
}

import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7007f = fromHex('#7fffffff');

  static Color lightGreen50002 = fromHex('#6deb4e');

  static Color black9007f = fromHex('#7f000000');

  static Color lightGreen50001 = fromHex('#6dea4e');

  static Color gray5001 = fromHex('#f8fcf8');

  static Color deepPurple800 = fromHex('#3506bd');

  static Color deepPurpleA20019 = fromHex('#198947e9');

  static Color gray90099 = fromHex('#99212121');

  static Color pink900 = fromHex('#851538');

  static Color red400 = fromHex('#f25454');

  static Color green700 = fromHex('#1ca321');

  static Color black90000 = fromHex('#00000000');

  static Color indigo90014 = fromHex('#1437226a');

  static Color black90084 = fromHex('#84000000');

  static Color gray20001 = fromHex('#edeeed');

  static Color gray20002 = fromHex('#eeeeee');

  static Color green60035 = fromHex('#35479862');

  static Color purple700 = fromHex('#7706bd');

  static Color blueGray900 = fromHex('#272d2f');

  static Color gray20003 = fromHex('#f0f0f0');

  static Color gray400 = fromHex('#b9b9b9');

  static Color blueGray100 = fromHex('#c7c9d1');

  static Color green4004c = fromHex('#4c73ae5c');

  static Color gray4007f = fromHex('#7fc0c0c0');

  static Color amber300 = fromHex('#ebdb4f');

  static Color gray200 = fromHex('#eaeaea');

  static Color orangeA20042 = fromHex('#42ebb73d');

  static Color whiteA70021 = fromHex('#21ffffff');

  static Color whiteA70066 = fromHex('#66ffffff');

  static Color black90011 = fromHex('#11000000');

  static Color indigo90003 = fromHex('#1f4574');

  static Color whiteA70026 = fromHex('#26ffffff');

  static Color blue = fromHex('#006DB7');

  static Color indigo90001 = fromHex('#010483');

  static Color indigo90002 = fromHex('#0d1089');

  static Color gray20099 = fromHex('#99e9e9e9');

  static Color black90019 = fromHex('#19000000');

  static Color blueGray40002 = fromHex('#888888');

  static Color blueGray40001 = fromHex('#7e818b');

  static Color black90014 = fromHex('#14000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA7001e = fromHex('#1effffff');

  static Color blueGray10001 = fromHex('#d6d6d6');

  static Color blueGray10002 = fromHex('#d9d9d9');

  static Color green600 = fromHex('#E6FEE6 ');

  static Color gray50 = fromHex('#f9fdf9');

  static Color pink40001 = fromHex('#e83a64');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color indigo90033 = fromHex('#33000383');

  static Color lightGreen500 = fromHex('#6eeb4f');

  static Color black900 = fromHex('#000000');

  static Color yellow700 = fromHex('#FFCF02');

  static Color redA400 = fromHex('#ff1a23');

  static Color purple1004f = fromHex('#4fe1b0da');

  static Color blueGray90066 = fromHex('#660b0d4d');

  static Color gray40033 = fromHex('#33c0c0c0');

  static Color blueGray10090 = fromHex('#90d9d9d9');

  static Color pink400 = fromHex('#f45679');

  static Color lightGreen50065 = fromHex('#656eeb4f');

  static Color gray90002 = fromHex('#171717');

  static Color gray90003 = fromHex('#222222');

  static Color whiteA700E5 = fromHex('#e5ffffff');

  static Color blueGray200 = fromHex('#bbc2cc');

  static Color blueGray400 = fromHex('#7d808b');

  static Color blue800 = fromHex('#134ce0');

  static Color blueGray600 = fromHex('#34748d');

  static Color whiteA700A2 = fromHex('#a2ffffff');

  static Color gray900 = fromHex('#1e1e1e');

  static Color blue600 = fromHex('#1878f1');

  static Color gray90001 = fromHex('#212121');

  static Color deepOrange40051 = fromHex('#51f87e38');

  static Color orange900 = fromHex('#eb5d0c');

  static Color blueGray60001 = fromHex('#3e8566');

  static Color purple10099 = fromHex('#99e1b0da');

  static Color gray30003 = fromHex('#e6e6e6');

  static Color gray300 = fromHex('#e0e0e0');

  static Color gray30002 = fromHex('#e2e2e2');

  static Color gray30001 = fromHex('#dedede');

  static Color green50044 = fromHex('#444fa95e');

  static Color gray100 = fromHex('#f1f1ff');

  static Color gray3007f = fromHex('#7fe2e2e2');

  static Color indigo90065 = fromHex('#65000383');

  static Color indigo80019 = fromHex('#1931477a');

  static Color indigo900 = fromHex('#000383');

  static Color gray90090 = fromHex('#90212121');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

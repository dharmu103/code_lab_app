// import 'package:flutter/material.dart';

// class CustomIconButton extends StatelessWidget {
//   CustomIconButton(
//       {this.shape,
//       this.padding,
//       this.variant,
//       this.alignment,
//       this.margin,
//       this.width,
//       this.height,
//       this.child,
//       this.onTap});

//   IconButtonShape? shape;

//   IconButtonPadding? padding;

//   IconButtonVariant? variant;

//   Alignment? alignment;

//   EdgeInsetsGeometry? margin;

//   double? width;

//   double? height;

//   Widget? child;

//   VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return alignment != null
//         ? Align(
//             alignment: alignment ?? Alignment.center,
//             child: _buildIconButtonWidget(),
//           )
//         : _buildIconButtonWidget();
//   }

//   _buildIconButtonWidget() {
//     return Padding(
//       padding: margin ?? EdgeInsets.zero,
//       child: IconButton(
//         visualDensity: VisualDensity(
//           vertical: -4,
//           horizontal: -4,
//         ),
//         iconSize: height ?? 0,
//         padding: EdgeInsets.all(0),
//         icon: Container(
//           alignment: Alignment.center,
//           width: width ?? 0,
//           height: height ?? 0,
//           padding: _setPadding(),
//           decoration: _buildDecoration(),
//           child: child,
//         ),
//         onPressed: onTap,
//       ),
//     );
//   }

//   _buildDecoration() {
//     return BoxDecoration(
//       color: _setColor(),
//       borderRadius: _setBorderRadius(),
//     );
//   }

//   _setPadding() {
//     switch (padding) {
//       default:
//         return EdgeInsets.all(3);
//     }
//   }

//   _setColor() {
//     switch (variant) {
//       default:
//         return Colors.blue;
//     }
//   }

//   _setBorderRadius() {
//     switch (shape) {
//       default:
//         return BorderRadius.circular(15);
//     }
//   }
// }

// enum IconButtonShape {
//   CircleBorder15,
// }

// enum IconButtonPadding {
//   PaddingAll3,
// }

// enum IconButtonVariant {
//   FillBlueA700,
// }

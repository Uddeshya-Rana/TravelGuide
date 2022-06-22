
import 'package:flutter/material.dart';
import 'package:travelguide/widgets/app_text.dart';

import '../constants/app_colors.dart';

class AppSelectorButton extends StatelessWidget {

  final Color color;
  final Color backGroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppSelectorButton(
      {Key? key,
        this.isIcon = false,
        this.text = "hi",
        this.icon,
        required this.color,
        required this.backGroundColor,
        required this.borderColor,
        required this.size,
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backGroundColor,
      ),
      child: isIcon == false ?
      Center(child: AppText(text: text!, textColor: color)):
      Center(child: Icon(icon, color: color,)),

    );
  }
}

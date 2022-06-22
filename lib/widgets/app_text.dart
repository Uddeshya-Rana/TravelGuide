

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color textColor;
  const AppText(
      { Key? key,
        this.size=16, //default size
        required this.text,
        this.textColor= Colors.black54, //default color
      }
      ): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: size,
      ),
    );
  }
}

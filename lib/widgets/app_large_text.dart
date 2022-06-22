
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color textColor;
  const AppLargeText(
        { Key? key,
          this.size=30, //default size
          required this.text,
          this.textColor= Colors.black87, //default color
        }
      ): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

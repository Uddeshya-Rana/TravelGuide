
import 'package:flutter/material.dart';
import 'package:travelguide/constants/app_colors.dart';
import 'package:travelguide/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {

  final bool? isResponsive; //optional, can be null
  final double? width;
  const ResponsiveButton({
    Key? key,
    this.width=120, //default width
    this.isResponsive = false
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appThemeColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive == true ?
             Container(
                 margin: const EdgeInsets.only(left: 20),
                 child: const AppText(text: "Book Trip Now", textColor: Colors.white)
             ) : Container(),

            Container(
              margin: isResponsive==true ? const EdgeInsets.only(right: 10): const EdgeInsets.all(0),
                child: Image.asset("img/button.png")
            ),
          ],
        ),

      ),
    );
  }
}

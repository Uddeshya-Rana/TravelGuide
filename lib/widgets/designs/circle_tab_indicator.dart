
import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration{

  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(circleRadius: radius, circleColor: color);
  }
  
}

class _CirclePainter extends BoxPainter{

  final Color circleColor;
  double circleRadius;

  _CirclePainter({required this.circleColor, required this.circleRadius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = circleColor;
    paint.isAntiAlias = true;
    //to place the circle in middle of its parent container use offset dx parameter to set width
    //to put the circle at bottom of the parent, make height same as configuration size

    final Offset circleOffset = Offset(configuration.size!.width/2 -circleRadius/2, configuration.size!.height -circleRadius) ;

    canvas.drawCircle(offset+circleOffset, circleRadius, paint);
  }

}

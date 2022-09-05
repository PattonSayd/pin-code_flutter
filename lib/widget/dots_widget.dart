
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DotsWidget extends StatelessWidget {
  final int dots;
  int count;
  static int rotateDots = 25;
  static Color initColor = Colors.grey.withOpacity(0.4);

  DotsWidget({
    Key? key,
    required this.dots,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (int i = 0; i < dots; i++) _paintFootprint(i)],
    );
  }

  Widget _paintFootprint(i) {
    if (count > 0) {
      initColor = Colors.black;
      count--;
    } else {
      initColor = Colors.grey.withOpacity(0.4);
    }
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation((rotateDots = rotateDots * -1) / 360),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CustomPaint(painter: MyPainter(initColor)),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color color;
  MyPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()..style = PaintingStyle.fill;
    paint1.color = color;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.22, size.height * 0.4762),
            width: size.width * 0.564,
            height: size.height * 0.676),
        paint1);

    Paint paint2 = Paint()..style = PaintingStyle.fill;
    paint2.color = color;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.665, size.height * 0.1302),
            width: size.width * 0.248,
            height: size.height * 0.18),
        paint2);

    Paint paint3 = Paint()..style = PaintingStyle.fill;
    paint3.color = color;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.722, size.height * 0.7722),
            width: size.width * 0.248,
            height: size.height * 0.18),
        paint3);

    Paint paint4 = Paint()..style = PaintingStyle.fill;
    paint4.color = color;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.788, size.height * 0.5602),
            width: size.width * 0.248,
            height: size.height * 0.18),
        paint4);

    Paint paint5 = Paint()..style = PaintingStyle.fill;
    paint5.color = color;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.774, size.height * 0.3362),
            width: size.width * 0.248,
            height: size.height * 0.18),
        paint5);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

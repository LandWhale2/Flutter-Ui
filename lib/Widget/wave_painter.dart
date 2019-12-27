import 'package:flutter/material.dart';



class WavePainter extends CustomPainter{

  final double sliderPosition;
  final double dragPercentage;

  final Color color;

  final Paint fillPainter;
  final Paint wavePainter;

  WavePainter({
    @required this.sliderPosition,
    @required this.dragPercentage,
    @required this.color}): fillPainter = Paint()
    ..color = color
    ..style = PaintingStyle.fill,
  wavePainter = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth =2.5;

  @override
  void paint(Canvas canvas , Size size){
    _paintAnchors(canvas, size);
    _paintLine(canvas, size);
    _paintBlock(canvas, size);
  }

  _paintAnchors(Canvas canvas, Size size){
    canvas.drawCircle(Offset(0,size.height), 5, fillPainter);
    canvas.drawCircle(Offset(size.width,size.height), 5, fillPainter);
  }

  _paintLine(Canvas canvas, Size size){
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, wavePainter);
  }

  _paintBlock(Canvas canvas, Size size){
    Rect sliderRect = Offset(sliderPosition, size.height -5) & Size(3,10);
    canvas.drawRect(sliderRect, fillPainter);
  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }

}
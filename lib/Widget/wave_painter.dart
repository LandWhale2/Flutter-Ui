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
        ..strokeWidth =2;

  @override
  void paint(Canvas canvas , Size size){
    _paintAnchors(canvas, size);
    _paintWaveLine(canvas, size);
//    _paintLine(canvas, size);
//    _paintBlock(canvas, size);
  }

  //선의 처음과 끝의 원형 기준점
  _paintAnchors(Canvas canvas, Size size){
    //offset 으로 지정된 좌표내에서 어디든 이동할수있으나 선의 처음 좌표
    canvas.drawCircle(Offset(0,size.height), 5, fillPainter);
    //선 끝
    canvas.drawCircle(Offset(size.width,size.height), 5, fillPainter);
  }

  _paintWaveLine(Canvas canvas, Size size){
    double bendWidth = 40;
    double bezierWidth = 40;

    double startOfBend = sliderPosition - bendWidth /2;
    double startOfBezier = startOfBend - bezierWidth;
    double endOfBend = sliderPosition + bendWidth/2;
    double endOfBezier = endOfBend + bezierWidth;

    double controlHeight = 0;
    double centerPoint = sliderPosition;


    double leftControlPoint1= startOfBend;
    double leftControlPoint2= startOfBend;
    double rightControlPoint1 = endOfBend;
    double rightControlPoint2 = endOfBend;



    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(startOfBezier, size.height);
    path.cubicTo(leftControlPoint1, size.height, leftControlPoint2, controlHeight, centerPoint, controlHeight);
    path.cubicTo(rightControlPoint1, controlHeight,rightControlPoint2, size.height, endOfBezier, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, wavePainter);
  }


  _paintLine(Canvas canvas, Size size){
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, wavePainter);
  }

  _paintBlock(Canvas canvas, Size size){
    Rect sliderRect = Offset(sliderPosition, size.height - 5) & Size(3,10);
    canvas.drawRect(sliderRect, fillPainter);
  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }

}
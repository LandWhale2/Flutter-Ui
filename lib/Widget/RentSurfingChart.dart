import 'package:flutter/material.dart';


class SurfingChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.1,
              height: MediaQuery.of(context).size.height/3.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(
                        0,20
                    ),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:EdgeInsets.only(left:5,bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width/13,
                      height: MediaQuery.of(context).size.height/4.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IndexText(context ,20),
                          IndexText(context ,10),
                          IndexText(context ,0),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.4,
                          height: MediaQuery.of(context).size.height/30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IndexText(context, 1),
                              IndexText(context, 2),
                              IndexText(context, 3),
                              IndexText(context, 4),
                              IndexText(context, 5),
                              IndexText(context, 6),
                              IndexText(context, 7),
                              IndexText(context, 8),
                              IndexText(context, 9),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: MediaQuery.of(context).size.height/4,
              child: CustomPaint(
                painter: CubicChart(
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 20,
            child: Container(
              width: MediaQuery.of(context).size.width/5.5,
              height: MediaQuery.of(context).size.height/23,
              decoration: BoxDecoration(
                color: Colors.amber,
//                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(
                child: Text(
                  '8.5',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor*22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget IndexText(BuildContext context,int index){
    return Text(
      index.toString(),
      style: TextStyle(
        color: Colors.black38,
        fontSize: MediaQuery.of(context).textScaleFactor*20
      ),
    );
  }
}








class CubicChart extends CustomPainter {




  @override
  void paint(Canvas canvas, Size size) {

    Offset offset = Offset(size.width/1.2, size.height/1.7);
    BezierChart(canvas, size);
    drawPoints(canvas, size, offset);
    ChartLine(canvas, size);
  }

  void ChartLine(Canvas canvas, Size size){
    drawLine(canvas, size, Offset(size.width/15, size.height/1.05), Offset(size.width/1.05, size.height/1.05));
    drawLine(canvas, size, Offset(size.width/15, size.height/1.6), Offset(size.width/1.05, size.height/1.6));
    drawLine(canvas, size, Offset(size.width/15, size.height/5), Offset(size.width/1.05, size.height/5));
  }


  void BezierChart(Canvas canvas, Size size){
    Paint paint = Paint()..color=Colors.black..strokeWidth=3..style= PaintingStyle.stroke;
    Path path = Path();
    path.moveTo(size.width/15, size.height/1.05);//시작점 좌표
    path.cubicTo(size.width/12, size.height/1.05, size.width/12,  size.height/1.05, size.width/4, size.height/1.12);
    path.cubicTo(size.width/2.3, size.height/1.3, size.width/3,  size.height/1.5, size.width/1.7, size.height/1.6);
    path.cubicTo(size.width/1.3, size.height/2, size.width/1.5,  size.height/10, size.width/1.2, size.height/1.7);
    canvas.drawPath(path, paint);

  }

  void drawLine(Canvas canvas, Size size, Offset p1, Offset p2){
    Paint paint = Paint()..color=Colors.black12..strokeWidth=3..style= PaintingStyle.stroke;
    canvas.drawLine(p1, p2, paint);
  }



  void drawPoints(Canvas canvas, Size size, Offset offset){
    Paint paint = Paint()..color=Colors.amber..strokeCap=StrokeCap.round..strokeWidth=1;
    canvas.drawCircle(offset, 10, paint);
  }

  @override
  bool shouldRepaint(CubicChart oldDelegate) {
    return true;
  }
}
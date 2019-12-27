import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2.5,
            decoration: BoxDecoration(
              color: Color.fromRGBO(111, 127, 243, 1),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 30),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                InkWell(
                    child: ProfileCircle(),
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DD()));
                  },
                ),
                Text(
                  'Sample Name',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor*21,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ProfileCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3,
      height: MediaQuery.of(context).size.height/6,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 140,
                height:140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(135, 149, 255, 1),
                ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/g1.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              Positioned(
                right: 1,
                bottom: 1,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3,color: Color.fromRGBO(135, 149, 255, 1),),
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                  child: Center(
                    child: Text(
                      '23',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class DD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing Paths',
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1)
                ),
              child: CustomPaint(
                painter: CurvePainter(),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint Rightpaint = Paint()
      ..color = Colors.red
      ..strokeCap =StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 300
      ..strokeWidth =2;

    _paintRightLine(canvas, size, Rightpaint);

  }

  _paintRightLine(Canvas canvas, Size size, Paint paint){
    Offset p1 = Offset(0,0);
    Offset p2 = Offset(size.width, size.height);
    canvas.drawLine(p1, p2, paint);
    print(size.width);
    print(size.height);
  }


//  _paintLeftLine(Canvas canvas, Size size, Paint paint){
//    Offset p1 = Offset(0,0);
//    Offset p2 = Offset(size.width, size.height);
//    canvas.drawLine(p1, p2, paint);
//  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
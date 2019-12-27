import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math';

import 'package:flutterui/Widget/wave_painter.dart';


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
                ProfileCircle(),
                Text(
                  'Sample Name',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor*21,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 300,),
                WaveSlider(),
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


class WaveSlider extends StatefulWidget {
  final double width;
  final double height;
  final Color color;

  const WaveSlider({Key key, this.width=350, this.height=50, this.color= Colors.black});

  @override
  _WaveSliderState createState() => _WaveSliderState();
}

class _WaveSliderState extends State<WaveSlider> {

  double _dragPosition = 0;
  double _dragPercentage = 0;



  void _updateDragPosition(Offset val){
    double newDragPosition = 0;

    if(val.dx <= 0){
      newDragPosition = 0;
    }else if(val.dx >= widget.width){
      newDragPosition = widget.width;
    }else{
      newDragPosition = val.dx;
    }


    setState(() {
      _dragPosition = newDragPosition;
      _dragPercentage = _dragPosition / widget.width;
    });
  }

  void _onDragUpdate(BuildContext context,DragUpdateDetails update){
    RenderBox box = context.findRenderObject();
    Offset offset = box.globalToLocal(update.globalPosition);
    _updateDragPosition(offset);
  }

  void _onDragStart(BuildContext context, DragStartDetails start){
    RenderBox box = context.findRenderObject();
    Offset offset = box.globalToLocal(start.globalPosition);
    _updateDragPosition(offset);
  }

  void _onDragEnd(BuildContext context, DragEndDetails end){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          width: widget.width,
          height: widget.height,
          child: CustomPaint(
            painter: WavePainter(
              color: widget.color,
              dragPercentage: _dragPercentage,
              sliderPosition: _dragPosition,
            ),
          ),
        ),
        onHorizontalDragUpdate: (DragUpdateDetails update)=> _onDragUpdate(context, update),
        onHorizontalDragStart: (DragStartDetails start)=> _onDragStart(context, start),
        onHorizontalDragEnd: (DragEndDetails end) => _onDragEnd(context, end),
      );
  }
}


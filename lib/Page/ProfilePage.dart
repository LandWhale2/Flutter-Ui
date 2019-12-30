import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter/scheduler.dart';
import 'package:flutterui/Widget/ExpenseNote.dart';
import 'dart:math';

import 'package:flutterui/Widget/RentSurfingChart.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
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
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  ProfileCircle(),
                  Text(
                    'Sample Name',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor*21,
                      color: Colors.white
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: MediaQuery.of(context).size.width/20,),
                      Text(
                        'Rent surfing',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor*35,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  SurfingChart(),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  ExpenseNote(num: 1, title: 'Philippines', subtitle: 'Rent Surfing on Manila',money: 'from \$52.00',),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  ExpenseNote(num: 2, title: 'Paris', subtitle: 'Rent Surfing on France',money: 'from \$75.00',),
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: MediaQuery.of(context).size.height/11.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      color: Colors.amber,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width/30,),
                        Container(
                          width: MediaQuery.of(context).size.width/2.3,
//                        height: MediaQuery.of(context).size.height/11.4,
                              child: Text(
                                'See more',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).textScaleFactor*30
                                ),
                              ),

                        ),
                        Icon(Icons.play_circle_filled, color: Colors.white, size: 50,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/3,
      height: MediaQuery.of(context).size.height/5.5,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/3,
                height:MediaQuery.of(context).size.height/6,
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




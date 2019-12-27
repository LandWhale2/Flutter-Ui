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
                ProfileCircle(),
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
      width: MediaQuery.of(context).size.width /3,
      height: MediaQuery.of(context).size.height/3,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(135, 149, 255, 1),
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
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
          ],
        ),
      ),
    );
  }
}


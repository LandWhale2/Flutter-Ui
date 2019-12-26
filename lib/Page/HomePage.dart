import 'package:flutter/material.dart';
import 'package:flutterui/Widget/DayChart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int subindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Container(
                  child: Text(
                    'Rating',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaQuery.of(context).textScaleFactor*20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/23),
                  child: Container(
                    child: Text(
                      'Top Activity',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).textScaleFactor*35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.event),
                ),
              ],
            ),//Top Activity
            SizedBox(height: MediaQuery.of(context).size.height/20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Menu(Colors.blueAccent, Colors.white, 'Surfing'),
                Menu(Colors.white, Colors.black54, 'Snowboard'),
                Menu(Colors.white, Colors.black54, 'Skiing'),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/50),
                  child: Container(
                    child: Text(
                      '5.248',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).textScaleFactor*35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/30),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).textScaleFactor*25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(Icons.perm_identity, size: 30,),
                    ],
                  ),
                ),
              ],
            ),//5.248
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.height/50),
                  child: Text(
                    'Activity',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaQuery.of(context).textScaleFactor*20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30),
            DayChart(),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                            child: SubMenu(1, 'Day'),
                          onTap: (){
                              setState(() {
                                subindex = 1;
                              });
                          },
                        ),
                        InkWell(
                          child: SubMenu(2, 'Week'),
                          onTap: (){
                            setState(() {
                              subindex = 2;
                            });
                          },
                        ),
                        InkWell(
                          child: SubMenu(3, 'Month'),
                          onTap: (){
                            setState(() {
                              subindex = 3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.add_circle, color: Colors.black87, size: 50,),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(18))
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Rental equipments',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).textScaleFactor*27,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Menu(Color color1, Color color2, String menuname){
    return Container(
      width: MediaQuery.of(context).size.width/3.5,
      height: MediaQuery.of(context).size.height/18,
      decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Center(
        child: Text(
          menuname,
          style: TextStyle(
              fontSize: MediaQuery.of(context).textScaleFactor*23,
              color: color2,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }

  Widget SubMenu(int index , String menuname, ){
    return Container(
      child: Text(
        menuname,
        style: TextStyle(
          color: (index ==subindex)?Colors.black:Colors.black54,
          fontSize: MediaQuery.of(context).textScaleFactor*25,
          fontWeight: (index == subindex)?FontWeight.w500:FontWeight.w400,
        ),
      ),
    );
  }
}

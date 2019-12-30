import 'package:flutter/material.dart';

class ExpenseNote extends StatelessWidget {
  String title, subtitle, money;
  int num;

  ExpenseNote({Key key, this.num, this.title, this.subtitle, this.money});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.1,
      height: MediaQuery.of(context).size.height/8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              (num == 1)?Container(
                width: MediaQuery.of(context).size.width/10,
                height: MediaQuery.of(context).size.height/18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black26
                ),
                child: Center(
                  child: Text(
                    num.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).textScaleFactor*20
                    ),
                  ),
                ),
              ):Container(
                width: MediaQuery.of(context).size.width/9.1,
                height: MediaQuery.of(context).size.height/11.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                    color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    num.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).textScaleFactor*20
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.3,
            height: MediaQuery.of(context).size.height/9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor*22,
                        color: Colors.black54,
                      ),
                    ),
                    Icon(
                      Icons.grade,
                      color: (num == 1)?Colors.black38:Colors.blueAccent,
                      size: 30,
                    ),
                  ],
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor*22,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      money,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor*22,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'more',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor*22,
                        color: (num ==1)?Colors.black54:Colors.black,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

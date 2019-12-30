import 'package:flutter/material.dart';

class DayChart extends StatefulWidget {
  @override
  _DayChartState createState() => _DayChartState();
}

class _DayChartState extends State<DayChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.1,
      height: MediaQuery.of(context).size.height/3.7,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(
              3,3
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            daycolumn(context,'Mo', 50),
            daycolumn(context,'Tu', 80),
            daycolumn(context,'We', 30),
            daycolumn(context,'Th', 60),
            daycolumn(context,'Fr', 33),
            daycolumn(context,'Sa', 30),
            daycolumn(context,'Su', 100),
          ],
        ),
      ),
    );
  }



  Widget daycolumn(BuildContext  context,String day, double rating){
    double barHeight =MediaQuery.of(context).size.height/6;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          day,
          style: TextStyle(
            fontSize: MediaQuery.of(context).textScaleFactor*16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width/45,
          height: barHeight,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/45,
                height: barHeight*rating/100,
                decoration: BoxDecoration(
                    color: (rating < 80&&rating >30)?Colors.amber:(rating >=80)?Colors.red:Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

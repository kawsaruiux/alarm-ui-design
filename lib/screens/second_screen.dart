import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {

  final double _smallFontSize = 12;
  final double _valFontSize = 25;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final Color _fontColor = Color(0xff5b6990);
  final double _smallFontSpacing = 1.3;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      alignment: Alignment.topCenter,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Average Sleep",
                    style: TextStyle(
                      color: _fontColor,
                      fontSize: _smallFontSize,
                      fontWeight: _smallFontWeight,
                      letterSpacing: _smallFontSpacing,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "06.55 h",
                    style: TextStyle(
                      color: _fontColor,
                      fontSize: _valFontSize,
                      fontWeight: _valFontWeight,
                      letterSpacing: _smallFontSpacing,
                    ),
                  ),

                  SizedBox(height: 15,),
                  Text(
                    "Average Sleep",
                    style: TextStyle(
                      color: _fontColor,
                      fontSize: _smallFontSize,
                      fontWeight: _smallFontWeight,
                      letterSpacing: _smallFontSpacing,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "06.55 h",
                    style: TextStyle(
                      color: _fontColor,
                      fontSize: _valFontSize,
                      fontWeight: _valFontWeight,
                      letterSpacing: _smallFontSpacing,
                    ),
                  ),
                ],
              ),

              //For the Graph
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xfff0f5fb),
                  border: Border.all(
                    width: 8,
                    color: Color(0xfffd3e1ed),
                  ),
                  borderRadius: BorderRadius.circular(3)
                ),
                padding: EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "This Week",
                      style: TextStyle(
                        fontSize: _smallFontSize,
                        fontWeight: _smallFontWeight,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor,
                      ),
                    ),
                    SizedBox(height: 15,),
                    //Graph Starts here
                    Container(
                      height: 120,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: CustomPaint(
                        foregroundPainter: GraphPainter(),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
          SizedBox(
            height: 25,
          ),
          new RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "Saturday"),
          new RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "Sunday"),
          new RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "Monday"),
          new RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "Tuesday"),
          new RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "Wednesday"),
          new RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "Thursday"),
          new RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "Friday"),
        ],
      ),
    );
  }
}

//Method graphPainter
class GraphPainter extends CustomPainter{

  Paint trackBarPaint = Paint() //This ".." is a shorthand method for writing "trackBarPaint.color = Color();"
  ..color = Color(0xff818aab)
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 12;

  Paint trackPaint = Paint()
  ..color = Color(0xffdee6f1)
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 12;

  @override
  void paint(Canvas canvas, Size size) {
    Path trackPath = Path();
    Path trackBArPath = Path();

    List val = [
      size.height * 0.8,
      size.height * 0.5,
      size.height * 0.9,
      size.height * 0.8,
      size.height * 0.6,
      size.height * 0.4,
    ];

    double origin = 8;

    for (int i = 0; i < val.length; i++){

      trackPath.moveTo(origin, size.height);
      trackPath.lineTo(origin, 0);

      trackBArPath.moveTo(origin, size.height);
      trackBArPath.lineTo(origin, val[i]);

      origin = origin + size.width * 0.18;  //For make distance 
    }
    canvas.drawPath(trackPath, trackPaint);
    canvas.drawPath(trackBArPath, trackBarPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class RecordItem extends StatelessWidget {
  const RecordItem({
    Key key,
    @required Color fontColor,
    @required double smallFontSpacing,
    @required this.day,

  }) : _fontColor = fontColor, _smallFontSpacing = smallFontSpacing, super(key: key);

  final Color _fontColor;
  final double _smallFontSpacing;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffdde9f7),
            width: 1.5,
        ),),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: _fontColor,
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: <Widget>[
              Text(
                "02.10.2019",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: _smallFontSpacing,
                  color: _fontColor,
                ),
              ),
              SizedBox(width: 25,),
              Expanded(
                child: Text(
                  "45.3 Minutes",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: _smallFontSpacing,
                    color: _fontColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
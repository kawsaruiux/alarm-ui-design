import 'package:flutter/material.dart';
import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/third_screen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clock',
      theme: new ThemeData(
        
        primarySwatch: Colors.blue,
      ),

      home: new AppClock(),
    );
  }
}


class AppClock extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomBar(),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: Container(
                color: Colors.transparent,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Color(0xffff0863),
                            width: 4.0,
                          ),
                          //insets: EdgeInsets.symmetric(horizontal: 35),
                          insets: EdgeInsets.fromLTRB(35.0, 20.0, 35.0, 0),
                        ),
                        indicatorWeight: 15,
                        labelColor: Color(0xff2d386b),
                        labelStyle: TextStyle(
                          fontSize: 10,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelColor: Colors.black26,
                        tabs: <Widget>[

                          Tab(
                            text: "AlARMS",
                            icon: Icon(
                              Icons.watch_later,
                              size: 40
                            ),
                          ),

                          Tab(
                          text: "RECORDS",
                          icon: Icon(
                            Icons.menu,
                            size: 40
                            ),
                          ),

                          Tab(
                          text: "PROFILE",
                          icon: Icon(
                            Icons.supervised_user_circle,
                            size: 40
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[

              Center(
                child: FirstTab(),
              ),

              Center(
                child: SecondTab(),
              ),

              Center(
                child: ThirdTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 10, 40, 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "Edit Alarm",
              style: TextStyle(letterSpacing: 1.5),
            ),
            color: Color(0xffff5e92),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            onPressed: (){},
          ),
          FloatingActionButton(
            child: Text(
              "+",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 5,
            highlightElevation: 3, 
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

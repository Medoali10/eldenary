import 'dart:math' as math;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'servo.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => MyHomePage(),
        'servo': (context) => Servo(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final databaseRef = FirebaseDatabase.instance.reference();
var volt = "0";
var current = "0";
var power = "0";

late var sub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      sub = databaseRef.onValue.listen((event) {
        setState(() {
          volt = event.snapshot.value["volt"];
          current = event.snapshot.value["current"];
          power = event.snapshot.value["power"];
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    sub.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
        Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 36),
      height: 270,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Color.fromRGBO(170, 70, 70, 1),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 5),
          Icon(Icons.power_settings_new_sharp,
            color: Colors.white,
            size: 150,),
          SizedBox(height: 20),
          Text('The status of your system', style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          )),
        ],
      ),
    ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(icon:Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 40,),
                  onPressed: () => {Navigator.pushReplacementNamed(context, 'servo')},)
                ),

              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 60,
                    child: Text('The voltage is', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontSize: 30,
                    )),),
                  Positioned(
                    left: 80,
                    top: 120,
                    child: Text(volt + 'V', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontSize: 30,
                    )),),
                  Positioned(
                    left: 10,
                    top: 200,
                    child: Text('The current is', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontSize: 30,
                    )),),
                  Positioned(
                    left: 80,
                    top: 260,
                    child: Text(current +'A', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontSize: 30,
                    )),),
                  Positioned(
                    right: -70,
                    top: 250,
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: Icon(Icons.electrical_services,
                      color: Colors.black26,
                      size: 200,),
                    ),),
                  Positioned(
                    right: -40,
                    top: 30,
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: Icon(Icons.electrical_services,
                        color: Colors.black26 ,
                        size: 200,),
                    ),),
                  Positioned(
                    left: 20,
                    top: 350,
                    child:  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap:  () {} ,
                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x80000000),
                                blurRadius: 12.0,
                                offset: Offset(0.0, 5.0),
                              ),
                            ],
                          color: Color.fromRGBO(170, 70, 70, 1),),
                        child: Center(
                          child: Text(
                            'Pwoer is ' + power,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),),
              ],),
            ),
          ],
        ));
  }
}









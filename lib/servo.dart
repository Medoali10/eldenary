import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Servo extends StatefulWidget {

  @override
  _ServoState createState() => _ServoState();
}

class _ServoState extends State<Servo> {
  final databaseRef = FirebaseDatabase.instance.reference();
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
                  height: 400,
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
                      Icon(Icons.power,
                        color: Colors.white,
                        size: 250,),
                      SizedBox(height: 50),
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
                    left: 10,
                    child: IconButton(icon:Icon(Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 50,),
                      onPressed: () => {Navigator.pushReplacementNamed(context, 'home')},)

                ),

              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 50,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap:  () {
                        databaseRef.update({'servo': '2'});
                      } ,
                      child: Material(
                        elevation: 2,
                        shape: CircleBorder(
                        ),
                        color: Color.fromRGBO(170, 70, 70, 1),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.subdirectory_arrow_left,
                                color: Colors.white,
                                size: 80,
                              ),
                              SizedBox(height: 10),

                            ],
                          ),
                        ),
                      ),
                    )),
                  Positioned(
                    left: 20,
                    top: 230,
                    child: Text('servo left', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontSize: 30,
                    )),),
                  Positioned(
                    right: 10,
                    top: 50,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap:  () {
                          databaseRef.update({'servo': '1'});
                        } ,
                        child: Material(
                            elevation: 2,
                            shape: CircleBorder(
                            ),
                            color: Color.fromRGBO(170, 70, 70, 1),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.subdirectory_arrow_right,
                                    color: Colors.white,
                                    size: 80,
                                  ),
                                  SizedBox(height: 10),

                                ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    right: 20,
                    top: 230,
                      child: Text('servo right', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontSize: 30,
                      )),
                 ),
                ],),
            ),],
        ));
  }
}

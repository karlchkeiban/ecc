//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//
//          primaryColorBrightness: Brightness.light
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//
//  @override
//  void initState(){
//    super.initState();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//        backgroundColor: Colors.grey[200],
//        body: Center(
//          child: Container(
//              height: 294,
//              width: 250,
//              decoration: new BoxDecoration(
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.black,
//                    blurRadius: 2.0, // has the effect of softening the shadow
//                    spreadRadius: 4.0, // has the effect of extending the shadow
//                  )
//                ],
//              ),
//              child: Column(
//                children: <Widget>[
//                  Image.asset(
//                    'images/QrCode.png',
//                  ),
//                  Container(height: 10,),
//                  Text("San this Qr code from the profile \n page of the mobile app in order to log in ",
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                        color: Colors.white
//                    ),
//                  ),
//                ],
//              )
//
//
//
//          ),
//        )
//
//    );
//  }
//
//}

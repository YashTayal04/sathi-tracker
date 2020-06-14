import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "firstscreen.dart";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // this is root  of application 
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MainScreen (),
    );
  }
}

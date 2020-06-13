import 'package:flutter/material.dart';
import 'mainscreen.dart';

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


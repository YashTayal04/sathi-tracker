import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "firstscreen.dart";
import "secondscreen.dart";

// class Id {
//   var id;
//   Id(this.id);
// }

// Id id;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var localID = preferences.getString('localID');
  // if (localID != null) {
  //   Id(localID);
  print("FirstScreen");
  print(localID);
  // }
  runApp(MaterialApp(
    home: localID == null ? Login() : SecondScreen(id: Id(localID)),
    // home: Login(),
  ));
}

import 'package:flutter/material.dart';
import "image_banner.dart";
import "secondscreen.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Id {
  var id;
  Id(this.id);
}

Id id;

// class MainScreen extends StatelessWidget {
//   final userNameInputController = TextEditingController();
//   final userPhoneInputController = TextEditingController();
//   Position position;
//   @override
//   Widget build(BuildContext context) {

//   }
// }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passController = TextEditingController();

  TextEditingController userNameInputController = TextEditingController();
  TextEditingController userPhoneInputController = TextEditingController();
  Position position;

  // String localID = '';

  // Future checkLogin() async {
  //   if (userNameInputController.text != null && userPhoneInputController.text != null) {

  //     position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  //     await Firestore.instance.collection('users').add({
  //       "name": userNameInputController.text,
  //       "phone": userPhoneInputController.text,
  //       "group_id": "",
  //       "lat": position.latitude,
  //       "lng": position.longitude
  //     }).then((value) async {
  //       id = Id(value.documentID);
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       preferences.setString('localID', value.documentID);
  //       print(id.id);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => SecondScreen(),
  //         ),
  //       );
  //     });

  // Fluttertoast.showToast(
  //     msg: "Login Successful",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     // timeInSecForIos: 1,
  //     backgroundColor: Colors.green,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Username & Password Invalid!",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         // timeInSecForIos: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Add your details "),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: 0.25 * MediaQuery.of(context).size.height,
                child: Center(
                    child: Text(
                  "Sathi Tracker",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ))),
            Container(
              height: 0.36 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(75.0, 0.0, 75.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        " Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                        controller: userNameInputController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        " Phone",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                        controller: userPhoneInputController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: RaisedButton(
                        color: Color(0xFF1963F2),
                        child: Text(
                          "Start",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () async {
                          if (userPhoneInputController.text.isNotEmpty &&
                              userNameInputController.text.isNotEmpty) {
                            position = await Geolocator().getCurrentPosition(
                                desiredAccuracy: LocationAccuracy.high);
                            await Firestore.instance.collection('users').add({
                              "name": userNameInputController.text,
                              "phone": userPhoneInputController.text,
                              "group_id": "",
                              "lat": position.latitude,
                              "lng": position.longitude
                            }).then((value) async {
                              id = Id(value.documentID);
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              preferences.setString(
                                  'localID', value.documentID);
                              //  print(id.id);
                              Fluttertoast.showToast(
                                  // Bottom Alert
                                  msg: "Login Successful",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  // timeInSecForIos: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen(id: id)));
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ImageBanner("assets/images/way.jpg"),
          ],
        ));

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Login'),
    //   ),
    //   body: Column(
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Text(
    //           'Login',
    //           style: TextStyle(fontSize: 25, fontFamily: 'Nasalization'),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: TextField(
    //           controller: userNameInputController,
    //           decoration: InputDecoration(labelText: 'Username'),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: TextField(
    //           controller: userPhoneInputController,
    //           decoration: InputDecoration(labelText: 'Phone Number'),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       MaterialButton(
    //         color: Colors.pink,
    //         onPressed: () {
    //           checkLogin();
    //         },
    //         child: Text('Login', style: TextStyle(color: Colors.white)),
    //       ),
    //       // ImageBanner("assets/images/way.jpg"),
    //     ],
    //   ),
    // );
  }
}

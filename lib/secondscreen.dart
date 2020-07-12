import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'thirdscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firstscreen.dart';
import 'dart:math';

class Group {
  var gid;
  Group(this.gid);
}

Group group;

class SecondScreen extends StatelessWidget {
  var id;
  SecondScreen({this.id});
  final userGroupIDInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Start your trip"),
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
              height: 0.60 * MediaQuery.of(context).size.height,
              width: 0.60 * MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      " Group ID",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: TextField(
                      controller: userGroupIDInputController,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.keyboard),
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
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.group_add,
                        color: Colors.white,
                      ),
                      color: Color(0xFF1963F2),
                      label: Text(
                        "Join trip",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () async {
                        // print(id.id);
                        if (userGroupIDInputController.text.isNotEmpty) {
                          group = Group(userGroupIDInputController.text);
                          await Firestore.instance
                              .collection('users')
                              .document(id.id)
                              .setData({
                            "group_id": userGroupIDInputController.text,
                          }, merge: true);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ThirdScreen(id: id, group: group)));
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(color: Colors.black),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      "OR",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Color(0xFF1963F2),
                      label: Text(
                        "Create trip",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () async {
                        Random random = new Random();
                        group = Group(random.nextInt(8999) + 1000);
                        await Firestore.instance
                            .collection('users')
                            .document(id.id)
                            .setData({
                          "group_id": group.gid,
                        }, merge: true);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ThirdScreen(id: id, group: group)));
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

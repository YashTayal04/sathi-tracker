import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'secondscreen.dart';
import 'firstscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var groupId;

class ThirdScreen extends StatefulWidget {
  // ThirdScreen() : super();
  // final String title =" Maps";s

  final Id id;
  final Group group;
  ThirdScreen({this.id, this.group});
  @override
  MapsState createState() => MapsState();
}

class MapsState extends State<ThirdScreen> {
  Completer<GoogleMapController> _controller = Completer();
  // static const LatLng _center =const LatLng(45.521563, -122.677433);
  // final Set<Marker> _markers ={};
  // LatLng _lastMapPosition = _center;
  // MapType _currentMapType =MapType.normal;
  // _onMapCreated(GoogleMapController controller){
  //   _controller.complete(controller);
  // }
  // _onCameraMove(CameraPosition position){
  //   _lastMapPosition =position.target;
  // }

  @override
  Widget build(BuildContext context) {
    //  Firestore.instance.collection("users").document(id.id).get().then((value){
    //   print(value.data["group_id"]);
    //   groupId=value.data["group_id"];
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text((group.gid).toString()),
      ),

      // body: Stack(
      //   children: <Widget>[
      //     GoogleMap(
      //       onMapCreated: _onMapCreated,
      // initialCameraPosition: CameraPosition(target: _center,zoom: 11.0,),
      //       mapType: _currentMapType,
      //       markers: _markers,
      //       onCameraMove: _onCameraMove,
      //     ),
      //   ],
      // )
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(28.644800, 77.216721), zoom: 12),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.group,
                  color: Colors.black,
                ),
                onPressed: () {
                  // do something
                  //    Firestore.instance.collection("users").document(id.id).get().then((value){
                  //   print(value.data["group_id"]);
                  //   groupId=value.data["group_id"];
                  // });
                  Firestore.instance
                      .collection("users")
                      .where("group_id", isEqualTo: group.gid)
                      .snapshots()
                      .listen((result) {
                    result.documents.forEach((result) {
                      print(result.data);
                    });
                  });
                },
              ),
              OutlineButton.icon(
                label: Text(
                  "end",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                onPressed: () async {
                  await Firestore.instance
                      .collection('users')
                      .document(id.id)
                      .updateData({
                    "group_id": "",
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondScreen(id: id)));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// AIzaSyA_8Jw4i9r9i4ADetiZPqwYVQpDlguj61E

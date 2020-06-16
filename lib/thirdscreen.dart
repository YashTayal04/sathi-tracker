import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ThirdScreen extends StatefulWidget{
  // ThirdScreen() : super();
  // final String title =" Maps";
  @override
  MapsState createState() => MapsState();

}
class MapsState extends State<ThirdScreen> {
  Completer<GoogleMapController> _controller =Completer();
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Group ID"),
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
        body: 
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(28.644800,77.216721),zoom:12),
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
              )
            )
          ],),
        );
  }
}
// AIzaSyA_8Jw4i9r9i4ADetiZPqwYVQpDlguj61E
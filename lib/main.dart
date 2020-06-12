import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: 'Welcome to Flutter',
      // home: Scaffold(
        appBar: AppBar(
          title:Text("Add your details "),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height:200,
              child:Center(
                  child:Text(
                    "Sathi Tracker",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500 ),
                  )
              )
            ),
            Container(
                height:300,
                child :Row(children: <Widget>[
                    Container(
                        width:80
                    ),
                    Container(
                        width:250,
                        // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: Text(
                                " Name",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 ),
                              ),
                            ),
                            Container(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(8),
                                    ),
                                  ),
                              ),
                            ),

                            ),

                            SizedBox(height: 30,),

                            Container(
                              child: Text(
                                " Phone",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 ),
                              ),
                            ),
                            Container(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(8),
                                    ),
                                  ),
                              ),
                            ),

                            ),
                            SizedBox(height: 40,),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: RaisedButton(
                              color: Color(0xFF1963F2),
                              child: Text("Start", style: TextStyle(fontSize:20, color: Colors.white),),
                              onPressed: () {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) =>SecondScreen())
                                );
                              },
                              shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(8.0),
    ),
                                ),
                              ),
                            
            
                          ],
                        ),
                ),
                    Container(
                        width:80
                    ),
                ],)
            ),
            // Container(
            //     color: Colors.red,
            //     child:Text(
            //         "Hello"
            //     )
            // )
          ],
        )
      // ),
    );
  }
}

class SecondScreen extends StatelessWidget {
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
              height:200,
              child:Center(
                  child:Text(
                    "Sathi Tracker",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500 ),
                  )
              )
            ),
            Container(
                height:300,
                child :Row(children: <Widget>[
                    Container(
                        width:80
                    ),
                    Container(
                        width:250,
                        // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: Text(
                                " Group ID",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 ),
                              ),
                            ),

                            Container(
                            child: TextField(
                              
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(8),
                                    ),
                                  ),
                              ),
                              
                            ),

                            ),
                            SizedBox(height: 30,),

                            SizedBox(
                              height: 40,
                              width: 40,
                              child: RaisedButton(
                              color: Color(0xFF1963F2),
                              child: Text("Join trip", style: TextStyle(fontSize:20, color: Colors.white),),
                              onPressed: () {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) =>SecondScreen())
                                );
                              },
                              shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                            ),
                                ),
                              ),

                            SizedBox(height: 30,),
                            Divider(
                            color: Colors.black
                          ),
                            
                            Container(
                              child: Text(
                                "OR",
                                
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500 ), textAlign: TextAlign.center,
                              ),
                              
                            ),

                            // Container(
                            // child: TextField(
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(),
                            //   ),
                            // ),

                            // ),

                            SizedBox(height: 30,),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: RaisedButton(
                              color: Color(0xFF1963F2),
                              child: Text("Create trip", style: TextStyle(fontSize:20, color: Colors.white),),
                              onPressed: () {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) =>SecondScreen())
                                );
                              },
                              shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                            ),
                                ),
                              ),
                            
            
                          ],
                        ),
                ),
                    Container(
                        width:80
                    ),
                ],)
            ),
            // Container(
            //     color: Colors.red,
            //     child:Text(
            //         "Hello"
            //     )
            // )
          ],
        )
    );
  }
}


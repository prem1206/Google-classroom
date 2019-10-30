import 'student_model.dart';
import 'student_services.dart';
import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'insideclass.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Student st;
  List faculty = List();
  _HomePageState() {
    loadclassdata().then((val) => setState(() {
          faculty = val;
          
        }));
    loadStudent().then((val) => setState(() {
          st = val;
        }));
  }
  List<String> image = [
    'breakfast.jpg',
    'Chemistry.jpg',
    'cinema.jpg',
    'code.jpg',
    'concert.jpg',
    'Design.jpg',
    'Honors.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: const Text(
            'Google Classroom',
            style: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          ),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          actions: <Widget>[
            PopupMenuButton<int>(
                padding: EdgeInsets.all(20),
                icon: Icon(
                  Icons.add,
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          "Join class",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text(
                          "Create class",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      )
                    ]),
            PopupMenuButton<int>(
                padding: EdgeInsets.all(8),
                icon: Icon(
                  Icons.more_vert,
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 5,
                        child: Text(
                          "Refresh",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      PopupMenuItem(
                        value: 6,
                        child: Text(
                          "Send Google feedback",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      )
                    ]),
          ],
        ),
        drawer: Drawerbar(st,faculty),
         
        body: Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ListView.builder(
                itemCount: image.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 500,
                            height: 143,
                            margin: EdgeInsets.only(bottom: 9),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              image: DecorationImage(
                                image: new AssetImage('images/' + image[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context)=>InsideView(st,faculty,index),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        faculty[index]['class-name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<int>(
                                      padding: EdgeInsets.all(8),
                                      offset: Offset(0, 100),
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 1,
                                          child: Center(
                                            child: Text("Unenroll"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 55,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        faculty[index]['Faculty'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                })));
  }
}

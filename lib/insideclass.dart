import 'package:classroom_clone/Drawer.dart';
import 'package:flutter/material.dart';

import 'student_model.dart';

class InsideView extends StatefulWidget {
  final Student st;
  final int index;
  List faculty = List();
  InsideView(this.st, this.faculty, this.index);
  @override
  _InsideViewState createState() => _InsideViewState(st, faculty, index);
}

class _InsideViewState extends State<InsideView> {
  final Student st;
  final int index;
  int _currentIndex = 0;
  List faculty = List();
  _InsideViewState(this.st, this.faculty, this.index);
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
          '',
          style: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          PopupMenuButton<int>(
              padding: EdgeInsets.all(20),
              icon: Icon(
                Icons.info_outline,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      enabled: false,
                      value: 3,
                      child: Text(
                        "Join class",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
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
      drawer: Drawerbar(st, faculty),
      body: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 140,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      image: DecorationImage(
                        image: new AssetImage('images/' + image[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 60, 0, 0),
                    child: Center(
                      child: Text(
                        faculty[index]['class-name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 500,
                height: 74,
                margin: EdgeInsets.only(bottom: 9),
                padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 50,
                  ),
                  title: TextField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: "Share with your class...",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    onChanged: (String str) {
                      print(str);
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      height: 5000,
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Container(
                                width: 500,
                                height: 123,
                                margin: EdgeInsets.only(bottom: 9),
                                padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(
                                        Icons.assignment,
                                        color: Colors.purple,
                                        size: 50,
                                      ),
                                      title: Text(
                                        "New Assignment: Implementation of Cookies using jsp",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      subtitle: Text(
                                        '11 sept',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Add class comment",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                          contentPadding: EdgeInsets.all(5),
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                          }))),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        //selectedIconTheme: IconThemeData(color: Colors.purple),
        
         onTap: (int i){
          setState(() {
            _currentIndex = i;
          }); 
          print(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer,
                   size: 30),
              title: new Text(
                'Stream',
                style: TextStyle(
                  
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment,
                   size: 30),
              title: new Text(
                'Classwork',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.people,
                   size: 30),
              title: new Text(
                'People',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
        ],
      ),
    );
  }
}

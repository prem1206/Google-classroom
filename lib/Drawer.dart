import 'package:classroom_clone/main.dart';
import 'insideclass.dart';
import 'student_model.dart';
import 'package:flutter/material.dart';

class Drawerbar extends StatefulWidget{
   final Student st;
  List faculty = List();
  Drawerbar(this.st,this.faculty);
@override
_DrawerbarState createState() => _DrawerbarState(st,faculty);
}
class _DrawerbarState extends State<Drawerbar>{
  Student st;
  List faculty = List();
    List<String> image = [
    'breakfast.jpg',
    'Chemistry.jpg',
    'cinema.jpg',
    'code.jpg',
    'concert.jpg',
    'Design.jpg',
    'Honors.jpg'
  ];
  _DrawerbarState(this.st,this.faculty);
@override
  Widget build(BuildContext context) {
    
    return Drawer(
          elevation: 4.0,
          child: new Column(
            children: <Widget>[
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                        st.studentName.substring(0, 1),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(st.studentName),
                    subtitle: Text(st.studentEmail),
                  ),
                ),
              ),
              new Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        title: Text("Classes"),
                        onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context)=>HomePage(),
                                  ),
                                );
                              },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                        title: Text("Calendar"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications_none,
                          color: Colors.black,
                        ),
                        title: Text("Notifications"),
                      ),
                      new Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(
                              "Enrolled",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.assignment,
                          color: Colors.black,
                        ),
                        title: Text("To-do"),
                      ),
                      Container(
                          height: 390,
                          child: ListView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            itemCount: image.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return new GestureDetector( 
                                onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context)=>InsideView(st,faculty,index),
                                  ),
                                );
                              },
                              child:ListTile(
                                leading: new CircleAvatar(
                                  backgroundImage: AssetImage('images/' + image[index]),
                                  child: Text(
                                    faculty[index]['class-name'].substring(0, 1),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(faculty[index]['class-name']),
                              ));
                            },
                          )),
                     
                      new Divider(),
                      ListTile(
                        leading: Icon(
                          Icons.archive,
                          color: Colors.black,
                        ),
                        title: Text("Archived Classes"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.folder_open,
                          color: Colors.black,
                        ),
                        title: Text("Classroom Folders"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        title: Text("Settings"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help_outline,
                          color: Colors.black,
                        ),
                        title: Text("Help"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        title: Text("Privacy Policy"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.toc,
                          color: Colors.black,
                        ),
                        title: Text("Terms Of Service"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
  }
}
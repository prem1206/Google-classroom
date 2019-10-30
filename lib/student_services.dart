import 'dart:async' show Future;
import 'student_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('data/student.json');
}

Future <Student> loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Student student = new Student.fromJson(jsonResponse);
  return student;
}


Future<String> _loadclassdataAsset() async{
  return await rootBundle.loadString('data/class.json');
}
/*
Future <List<Faculty>> loadclassdata() async{
  List<Faculty> response = List();
  String s = await _loadclassdataAsset();
  response  = (json.decode(s) as List).map((data)=> new Faculty.fromJson(data)).toList();
  //Faculty teacher = new Faculty.fromJson(response);
   return response;
}
*/
Future  loadclassdata() async{
  String s = await _loadclassdataAsset();
  List decoded = (jsonDecode(s) as List).map((data) => data).toList();
  print(decoded);
  //Faculty teacher = new Faculty.fromJson(response);
   return decoded;
}
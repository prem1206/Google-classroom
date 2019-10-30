class Student{
  String studentName,studentEmail;
  
  Student({
    this.studentName,
    this.studentEmail
 });

Student.fromJson(Map<String, dynamic> parsedJson):
  studentName= parsedJson['name'],
  studentEmail = parsedJson['emailid'];
}

class Faculty{
  String subject,facultyName;

  Faculty._({
    this.subject,
    this.facultyName
    });

 factory Faculty.fromJson(Map<String,dynamic> parsedJson){ 
    return new Faculty._( 
    subject: parsedJson['class-name'],
    facultyName : parsedJson['Faculty'],
    );
}}
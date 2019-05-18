import 'package:cloud_firestore/cloud_firestore.dart';


class Subject {

  String sid;
  String name;
  String shortName;
  String color;

  //List<ClassData> classes;
  Subject();



  Subject.fromDocument(DocumentSnapshot document){
    sid = document.documentID;
    name = document.data["name"];
    shortName = document.data["shortName"];
    color = document.data["Color"];
  }

  Map<String, dynamic> toMap(){
    return {
      "sid" : sid,
      "name": name,
      "shortName": shortName,
      "color" : color
    };
  }
}
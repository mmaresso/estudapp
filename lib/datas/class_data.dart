import 'package:cloud_firestore/cloud_firestore.dart';


class Class {

  String name;
  int number;
  int endPage;
  int currentPage;
  int exercicies; 
  double percentHits;



  //List<ClassData> classes;
  Class();



  Class.fromDocument(DocumentSnapshot document){
    
    name = document.data["name"];
    number = document.data["number"];
    endPage = document.data["endPage"];
    currentPage = document.data["currentPage"];
    exercicies = document.data["exercicies"];
    percentHits = document.data["percentHits"];
  }

  Map<String, dynamic> toMap(){
    return {
      
      "name": name,
      "number": number,
      "endPage": endPage,
      "currentPage": currentPage,
      "exercicies": exercicies,
      "percentHits": percentHits
    };
  }
}
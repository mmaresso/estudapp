import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudar_app/datas/subjects_data.dart';
import 'package:estudar_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class SubjectModel extends Model {

  UserModel user;

  //List<Subject> subjects = [];

  SubjectModel(this.user);

  static SubjectModel of(BuildContext context) =>
      ScopedModel.of<SubjectModel>(context);

  void addSubject(Subject subject){
    
    Firestore.instance.collection("user").document(user.firebaseUser.uid).collection("subjects").add(subject.toMap()).then((doc){
      doc.updateData({
        "sid" :  doc.documentID});
      subject.sid = doc.documentID;
    });
    //subjects.add(subject);
    notifyListeners();
  }
  void removeSubject(String sid){

    Firestore.instance.collection("user").document(user.firebaseUser.uid).collection("subjects").document(sid).delete();
    //subjects.remove(subject);
    notifyListeners();
  }
}
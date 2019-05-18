import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudar_app/models/user_model.dart';
import 'package:estudar_app/screens/info_subject_screen.dart';
import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final UserModel user;
  SubjectTile(this.snapshot, this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.library_books,
          color: Color(int.parse(snapshot.data["color"])), size: 40.0),
      title: Column(
        children: <Widget>[
          Text(
            snapshot.data["name"],
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            snapshot.data["shortName"],
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        size: 32.0,
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InfoSubjectScreen(snapshot, user)));
      },
    );
  }
}

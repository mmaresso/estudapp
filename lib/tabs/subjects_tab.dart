import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudar_app/datas/user_data.dart';
import 'package:estudar_app/models/subject_model.dart';
import 'package:estudar_app/models/user_model.dart';
import 'package:estudar_app/screens/new_subject_screen.dart';
import 'package:estudar_app/tiles/subject_tile.dart';
import 'package:estudar_app/widgets/custom_drawer.dart';
import 'package:estudar_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class SubjectsTab extends StatelessWidget {

  final UserModel  user;
  final PageController controller;

  SubjectsTab(this.controller, this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(controller),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Nova Disciplina'),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> NewSubjectScreen()));
        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           //IconButton(icon: Icon(Icons.menu), onPressed: () {},),

          ],
        ),
      ),
      body: ScopedModelDescendant<SubjectModel>(
          builder: (context, child, model){

            return HeaderWidget("DISCIPLINAS", user.firebaseUser != null ?
            FutureBuilder<QuerySnapshot>(
                future: Firestore.instance.collection("user").document(user.firebaseUser.uid).collection("subjects").getDocuments(),
                builder: (context, snapshot){
                  if(!snapshot.hasData)
                    return Center(child: CircularProgressIndicator(),);
                  else{
                    var dividedTiles = ListTile
                        .divideTiles(tiles: snapshot.data.documents.map(
                            (doc) {
                          return SubjectTile(doc, user);
                        }).toList(),
                        color: Colors.grey[500]).toList();

                    return
                      ListView(
                          children: dividedTiles
                      );
                  }
                } ) : Center(child: Text(""),)
            );
          }
      ),
    );
  }
}



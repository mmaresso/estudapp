import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudar_app/models/user_model.dart';
import 'package:estudar_app/tiles/class_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:estudar_app/models/subject_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoSubjectScreen extends StatelessWidget {
  final DocumentSnapshot snapshotsubject;
  final UserModel user;

  InfoSubjectScreen(this.snapshotsubject, this.user);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            snapshotsubject.data["name"],
            style: TextStyle(fontSize: 16.0),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Aulas",
              ),
              Tab(
                text: "Página",
              ),
              Tab(
                text: "Revisão",
              ),
            ],
          ),
          backgroundColor: Color(int.parse(snapshotsubject.data["color"])),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.solidEdit,
                size: 16.0,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.solidTrashAlt,
                size: 16.0,
              ),
              onPressed: () {
                _showDialog(context);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.add),
          label: const Text('Nova Aula'),
          backgroundColor: Color(int.parse(snapshotsubject.data["color"])),
          onPressed: () {
            _showDialogNewClass(context);

          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("user")
                .document(user.firebaseUser.uid)
                .collection("subjects")
                .document(snapshotsubject.data["sid"])
                .collection("class")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                    var dividedTiles = ListTile.divideTiles(
                            tiles: snapshot.data.documents.map((doc) {
                              return ClassTile(doc, snapshotsubject, 1);
                            }).toList(),
                            color: Colors.grey[500])
                        .toList();

                    var dividedTiles2 = ListTile.divideTiles(
                        tiles: snapshot.data.documents.map((doc) {
                          return ClassTile(doc, snapshotsubject, 2);
                        }).toList(),
                        color: Colors.grey[500])
                    .toList();

                    var dividedTiles3 = ListTile.divideTiles(
                        tiles: snapshot.data.documents.map((doc) {
                          return ClassTile(doc, snapshotsubject, 3);
                        }).toList(),
                        color: Colors.grey[500])
                    .toList();




                return TabBarView(
                  children: <Widget>[
                    ListView(children: dividedTiles),
                     ListView(children: dividedTiles2),
                    ListView(children: dividedTiles3),
                  ],
                );
              }
            }),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text('Deletar'),
          content: SingleChildScrollView(
            child: Text("Tem certeza?"),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Sim'),
              onPressed: () {
                SubjectModel.of(context)
                    .removeSubject(snapshotsubject.data["sid"]);

                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


void _showDialogNewClass(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text('Nova Aula'),
          content: SingleChildScrollView(
            child: Text("Tem certeza?"),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Salvar'),
              onPressed: () {
                

                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
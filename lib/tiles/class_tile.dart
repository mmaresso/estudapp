import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudar_app/datas/class_data.dart';
import 'package:estudar_app/models/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ClassTile extends StatefulWidget {
  final DocumentSnapshot snapshot;
  final DocumentSnapshot snapshotsubject;
  final int tab;
  ClassTile(this.snapshot, this.snapshotsubject, this.tab);

  @override
  _ClassTileState createState() =>
      _ClassTileState(snapshot, snapshotsubject, tab);
}

class _ClassTileState extends State<ClassTile> {
  final DocumentSnapshot snapshot;
  final DocumentSnapshot snapshotsubject;
  final int tab;
  int number = 0;
  int endPage = 0;
  int currentPage = 0;
  int exercicies = 0;
  double percentHits = 0;

  _ClassTileState(this.snapshot, this.snapshotsubject, this.tab);

  @override
  Widget build(BuildContext context) {
    if (tab == 1)
      return Column(
        children: <Widget>[
          Card(
            borderOnForeground: true,
            elevation: 3,
            child: Dismissible(
              key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.white,
                  ),
                ),
              ),
              direction: DismissDirection.startToEnd,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    (snapshot.data["number"]).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor:
                      Color(int.parse(snapshotsubject.data["color"])),
                ),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        snapshot.data["name"],
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) {
                SubjectModel.of(context)
                    .removeClass(snapshot.data["cid"], snapshotsubject);
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      );
    else if (tab == 2)
      return Column(
        children: <Widget>[
          Card(
              borderOnForeground: true,
              elevation: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      color: Color(int.parse(snapshotsubject.data["color"])),
                      child: Center(
                        child: Text(
                          (snapshot.data["number"]).toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    CircularPercentIndicator(
                      footer: Text("Leitura"),
                      animation: true,
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.20,
                      center: Text("20%"),
                      progressColor: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      footer: Text("Exercícios"),
                      animation: true,
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.90,
                      center: Text("90%"),
                      progressColor: Colors.orange,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      footer: Text("% Acerto"),
                      animation: true,
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.60,
                      center: Text("60%"),
                      progressColor: Colors.yellow,
                    ),
                  ],
                ),
              ))
        ],
      );
    else {
      Class classes = Class();
      TextEditingController nameController =
          TextEditingController(text: snapshot.data["name"]);
      classes.name = nameController.text;
      classes.cid = snapshot.data["cid"];
      classes.number = snapshot.data["number"];
      classes.endPage = snapshot.data["endPage"];
      classes.currentPage = snapshot.data["currentPage"];
      classes.exercicies = snapshot.data["exercicies"];
      classes.percentHits = snapshot.data["percentHits"];
      return SingleChildScrollView(
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration:
                              InputDecoration(labelText: "Assunto(s) da Aula"),
                        ),
                      ),
                      RaisedButton(
                        child: Text(
                          "Salvar",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        textColor: Colors.white,
                        elevation: 8.0,
                        color: Color(int.parse(snapshotsubject.data["color"])),
                        onPressed: () {
                          classes.name = nameController.text;
                          classes.number = (classes.number) + number;
                          classes.exercicies =
                              (classes.exercicies) + exercicies;
                          classes.currentPage =
                              (classes.currentPage) + currentPage;
                          classes.endPage = (classes.endPage) + endPage;
                          classes.percentHits =
                              (classes.percentHits) + percentHits;
                          SubjectModel.of(context)
                              .updateClass(classes, snapshotsubject);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Nº Aula",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  if ((classes.number) + number > 0) number--;
                                });
                                print("$number");
                              }),
                          Text(((classes.number) + number).toString()),
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  number++;
                                });
                                print("$number");
                              }),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Nº Exercicios",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  if ((classes.exercicies) + exercicies > 0)
                                    exercicies--;
                                });
                                print("$exercicies");
                              }),
                          Text(((classes.exercicies) + exercicies).toString()),
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  exercicies++;
                                });
                                print("$exercicies");
                              }),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Página Atual",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  if ((classes.currentPage) + currentPage > 0)
                                    currentPage--;
                                });
                                print("$currentPage");
                              }),
                          Text(
                              ((classes.currentPage) + currentPage).toString()),
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  currentPage++;
                                });
                                print("$currentPage");
                              }),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Nº Páginas",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  endPage--;
                                });
                                print("$endPage");
                              }),
                          Text(((classes.endPage) + endPage).toString()),
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  endPage++;
                                });
                                print("$endPage");
                              }),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Acertos %",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  percentHits--;
                                });
                                print("$percentHits");
                              }),
                          Text(((classes.percentHits) + percentHits)
                                  .toStringAsFixed(0) +
                              "%"),
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Color(
                                    int.parse(snapshotsubject.data["color"])),
                              ),
                              onPressed: () {
                                setState(() {
                                  percentHits++;
                                });
                                print("$percentHits");
                              }),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 46.0),
            ],
          ),
        ),
      );
    }
  }
}

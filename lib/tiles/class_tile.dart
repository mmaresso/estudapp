import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ClassTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final DocumentSnapshot snapshotsubject;
  final int tab;
  ClassTile(this.snapshot, this.snapshotsubject, this.tab);

  @override
  Widget build(BuildContext context) {
    if (tab == 1)
      return Column(
        children: <Widget>[
          Card(
            borderOnForeground: true,
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  (snapshot.data["number"]).toString(),
                ),
                backgroundColor:
                    Color(int.parse(snapshotsubject.data["color"])),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data["name"],
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
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
                
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                  children: <Widget>[
                    Container(
              
                      height: 20,
                      width: 20,
                      color: Color(int.parse(snapshotsubject.data["color"])),
                      child: Center( child: Text((snapshot.data["number"]).toString(), style: TextStyle(color: Colors.white),),),
                    ),
                     CircularPercentIndicator(
                      footer: Text("Exercícios"),
                      animation: true,
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.20,
                      center:  Text("20%"),
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
                      percent: 0.30,
                      center: Text("30%"),
                      progressColor: Colors.orange,
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                     CircularPercentIndicator(
                      footer: Text("Exercícios"),
                      animation: true,
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.60,
                      center:  Text("60%"),
                      progressColor: Colors.yellow,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    
                    
                     
                  ],
                ),
              )
            
          )
        ],
      );
    else
      return Column(
        children: <Widget>[
          Card(
            borderOnForeground: true,
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  (snapshot.data["number"]).toString(),
                ),
                backgroundColor:
                    Color(int.parse(snapshotsubject.data["color"])),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    (snapshot.data["current_page"]).toString(),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          )
        ],
      );
  }
}

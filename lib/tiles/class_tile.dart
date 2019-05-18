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
                      footer: Text("Leitura"),
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
                      center:  Text("60%"),
                      progressColor: Colors.yellow,
                    ),
                    
                    
                    
                     
                  ],
                ),
              )
            
          )
        ],
      );
    else{
      TextEditingController  nameController = TextEditingController();
      TextEditingController  numberController = TextEditingController();
      TextEditingController endPageController = TextEditingController();
      TextEditingController  currentPageController = TextEditingController();
      TextEditingController  exerciciesController = TextEditingController();
      TextEditingController percentHitsController = TextEditingController();

      nameController.text = snapshot.data["name"];
      numberController.text = (snapshot.data["number"]).toString();
      endPageController.text = (snapshot.data["endPage"]).toString();
      currentPageController.text = (snapshot.data["currentPage"]).toString();
      exerciciesController.text = (snapshot.data["exercicies"]).toString();
      percentHitsController.text = (snapshot.data["percentHits"]).toString();


      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 16.0, left: 100.0, right: 100.0, bottom: 0),
          child: Column(
                 
                  children: <Widget>[
                    
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      
                      decoration: InputDecoration(
                          labelText: "Assunto(s) da Aula"
                      ),
                      
                    ),
                    SizedBox(height: 24.0),
                    
                    TextFormField(
                      controller: numberController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          labelText: "Nº da Aula"
                      ),

                    
                    ),
                    
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: endPageController,
                       textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          labelText: "Nº Páginas"
                      ),

                      
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: currentPageController,
                       textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          labelText: "Página Atual"
                      ),

                      
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: exerciciesController,
                       textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          labelText: "Exercicios Feitos"
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: percentHitsController,
                       textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          labelText: "Acertos %"
                      ),
                    ),

                    SizedBox(height: 32.0),
                    RaisedButton(
                      child: Text("Salvar", style: TextStyle(fontSize: 18.0),),
                      textColor: Colors.white,
                      elevation: 8.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        
                          Navigator.of(context).pop();
                      },
                    ),
                  ],
                ) ,),);
    }
  }
}

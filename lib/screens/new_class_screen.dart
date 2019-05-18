import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudar_app/datas/class_data.dart';
import 'package:estudar_app/models/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NewClassScreen extends StatefulWidget {

  final DocumentSnapshot snapshotsubject;
  NewClassScreen(this.snapshotsubject);
  @override
  _NewClassScreenState createState() => _NewClassScreenState(snapshotsubject);
}

class _NewClassScreenState extends State<NewClassScreen> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final endPageController = TextEditingController();
  final currentPageController = TextEditingController();
  final exerciciesController = TextEditingController();
  final percentHitsController = TextEditingController();
  final DocumentSnapshot snapshotsubject;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _NewClassScreenState(this.snapshotsubject);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(int.parse(snapshotsubject.data["color"])),
        title: Text("Nova Aula"),
        centerTitle: true,
        
      ),
      body: ScopedModelDescendant<SubjectModel>(
          builder: (context, child, model){
            return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          hintText: "Assunto(s) da Aula"
                      ),
                      validator: (text){
                        if(text.isEmpty ) return "Inválido!";
                      },
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: numberController,
                      decoration: InputDecoration(
                          hintText: "Nº da Aula"
                      ),

                      validator: (text){
                        if(text.isEmpty ) return "Número inválida!";
                      },
                    ),
                    
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: endPageController,
                      decoration: InputDecoration(
                          hintText: "Nº de Páginas"
                      ),

                      validator: (text){
                        if(text.isEmpty ) return "Número inválida!";
                      },
                    ),
                    
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: exerciciesController,
                      decoration: InputDecoration(
                          hintText: "Nº Exercícios"
                      ),
                      
                      validator: (text){
                        if(text.isEmpty ) return "Número inválida!";
                      },
                    ),

              
                    


                    SizedBox(height: 32.0),
                    RaisedButton(
                      child: Text("Adicionar", style: TextStyle(fontSize: 18.0),),
                      textColor: Colors.white,
                      elevation: 8.0,
                      color: Color(int.parse(snapshotsubject.data["color"])),
                      onPressed: (){
                        if(_formKey.currentState.validate()){

                          Class classes = Class();
                            classes.name = nameController.text;
                            classes.number = int.parse(numberController.text);
                            classes.endPage = int.parse(endPageController.text);
                            classes.currentPage = 0;
                            classes.exercicies = int.parse(exerciciesController.text);
                            classes.percentHits = 0.0;
                            
                          print(classes.name);
                           print(classes.number);
                            print(classes.endPage);
                             print(classes.currentPage);


                          SubjectModel.of(context).addClass(classes, snapshotsubject);

                         
                        }
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Container(
                                padding: EdgeInsets.only(left: 56.0),
                                child: Text("Aula de ${snapshotsubject.data["name"]} adicionada com sucesso!",),),
                          backgroundColor: Theme.of(context).primaryColor,
                          duration: Duration(seconds: 2),));

                        Future.delayed(Duration(seconds: 2)).then((_){
                          Navigator.of(context).pop();
                      });
                        },
                    ),
                  ],
                ));
          }
      ),
    );
  }

  
  

}

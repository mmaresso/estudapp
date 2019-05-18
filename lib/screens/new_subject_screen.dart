import 'package:estudar_app/datas/subjects_data.dart';
import 'package:estudar_app/models/subject_model.dart';
import 'package:estudar_app/widgets/colorpick_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NewSubjectScreen extends StatefulWidget {
  @override
  _NewSubjectScreenState createState() => _NewSubjectScreenState();
}

class _NewSubjectScreenState extends State<NewSubjectScreen> {
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  String subjectColor ;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Nova Disciplina"),
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
                      decoration: InputDecoration(
                          hintText: "Nome"
                      ),
                      validator: (text){
                        if(text.isEmpty ) return "Nome inválido!";
                      },
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: nicknameController,
                      decoration: InputDecoration(
                          hintText: "Tag"
                      ),

                      validator: (text){
                        if(text.isEmpty ) return "Tag inválida!";
                      },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(top: 36.0),
                        child:  Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Cor:    ", style: TextStyle(fontSize: 24.0),),
                            ColorPick(subjectColor, getColor),
                          ],
                        ),
                      )
                      ),


                    SizedBox(height: 32.0),
                    RaisedButton(
                      child: Text("Adicionar", style: TextStyle(fontSize: 18.0),),
                      textColor: Colors.white,
                      elevation: 8.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        if(_formKey.currentState.validate()){

                          Subject subject = Subject();
                            subject.name = nameController.text;
                           subject.shortName = nicknameController.text;
                            subject.color = subjectColor;

                          SubjectModel.of(context).addSubject(subject);

                          print(subject.name) ;
                          print(subject.shortName);
                          print(subject.color);
                          print(subject.sid);
                        }
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Container(
                                padding: EdgeInsets.only(left: 56.0),
                                child: Text("Disciplina adicionada com sucesso!",),),
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

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Container(padding: EdgeInsets.only(left: 56.0), child: Text("Usuário criado com sucesso!",),),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),));

    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }
  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Container(padding: EdgeInsets.only(left: 56.0), child: Text("Falha ao criar usuário!",),),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),));
  }

  getColor(color){
    subjectColor = color;
  }

}

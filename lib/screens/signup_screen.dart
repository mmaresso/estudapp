import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:estudar_app/models/user_model.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "Nome"
                      ),
                      validator: (text){
                        if(text.isEmpty ) return "Nome inválido!";
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: nicknameController,
                      decoration: InputDecoration(
                          hintText: "Apelido"
                      ),

                      validator: (text){
                        if(text.isEmpty ) return "Apelido inválido!";
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "E-mail"
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text){
                        if(text.isEmpty || !text.contains("@")) return "E-mail inválido!";
                      },
                    ),

                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Senha"
                      ),
                      obscureText: true,
                      validator: (text){
                        if(text.isEmpty || text.length < 6) return "E-mail inválido!";
                      },
                    ),
                    SizedBox(height: 32.0),
                    RaisedButton(
                      child: Text("Cadastrar", style: TextStyle(fontSize: 18.0),),
                      textColor: Colors.white,
                      elevation: 8.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        if(_formKey.currentState.validate()){

                          Map<String, dynamic> userData = {
                            "name" : nameController.text,
                            "nickname" : nicknameController.text,
                            "email" : emailController.text,
                          };

                          model.signUp(
                              userData: userData,
                              pass: passwordController.text,
                              onSucess: _onSuccess,
                              onFail: _onFail
                          );

                        }
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

}




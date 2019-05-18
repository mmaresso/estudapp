import 'package:estudar_app/models/user_model.dart';
import 'package:estudar_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("Criar Conta", style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignupScreen()));

            },
          )
        ],
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
                    controller: emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
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
                        icon: Icon(Icons.lock),
                        hintText: "Senha"
                    ),
                    obscureText: true,
                    validator: (text){
                      if(text.isEmpty || text.length < 6) return "E-mail inválido!";
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child:FlatButton(onPressed: (){
                      if(emailController.text.isEmpty)
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Container(padding: EdgeInsets.only(left: 56.0), child: Text("Insira seu e-mail para recuperação",),),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 2),));
                      else{
                        model.recoverPass(emailController.text);
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Container(padding: EdgeInsets.only(left: 56.0), child: Text("Confira seu e-mail!",),),
                              backgroundColor: Theme.of(context).primaryColor,
                              duration: Duration(seconds: 2),));
                      }
                    }, child: Text("Esqueci minha senha", textAlign: TextAlign.right,)) ,
                  ),
                  SizedBox(height: 16.0),
                  RaisedButton(
                    child: Text("Entrar", style: TextStyle(fontSize: 18.0),),
                    textColor: Colors.white,
                    elevation: 8.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      if(_formKey.currentState.validate()){}
                      model.singIn(
                        email: emailController.text,
                        pass: passwordController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail
                      );
                    },
                  ),
                ],
              ),);
          }
      ) ,

    );


    }

    void _onSuccess(){
      Navigator.of(context).pop();
    }

    void _onFail(){
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Container(padding: EdgeInsets.only(left: 56.0), child: Text("Falha ao entrar!",),),
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 2),));
    }
  }


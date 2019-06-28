import 'package:estudar_app/screens/home_screen.dart';
import 'package:estudar_app/screens/login_screen.dart';
import 'package:estudar_app/screens/new_subject_screen.dart';
import 'package:estudar_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/subject_model.dart';
import 'models/user_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
        return  ScopedModel<SubjectModel>(
          model: SubjectModel(model),
          child: MaterialApp(
            title: 'EstudApp',
            theme: new ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Color.fromRGBO(58, 66, 86, 1.0)
            ),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(model),
          )
        );
      })
    );
  }
}


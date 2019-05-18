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

class StatisticTab extends StatelessWidget {

  final UserModel  user;
  final PageController controller;

  StatisticTab(this.controller, this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(controller),
      body: ScopedModelDescendant<SubjectModel>(
          builder: (context, child, model){

            return HeaderWidget("Estatísticas", user.firebaseUser != null ?
                    Center(child: Text(""),)
                  
                 : Center(child: Text(""),)
            );
          }
      ),
    );
  }
}



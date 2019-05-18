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

class CheckListTab extends StatelessWidget {

  final UserModel  user;
  final PageController controller;

  CheckListTab(this.controller, this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(controller),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           IconButton(icon: Icon(Icons.search), onPressed: () {},),
           IconButton(icon: Icon(Icons.menu), onPressed: () {},),
          ],
        ),
      ),
      body: ScopedModelDescendant<SubjectModel>(
          builder: (context, child, model){

            return HeaderWidget("Checklist", user.firebaseUser != null ?
                    Center(child: Text(""),)
                  
                 : Center(child: Text(""),)
            );
          }
      ),
    );
  }
}


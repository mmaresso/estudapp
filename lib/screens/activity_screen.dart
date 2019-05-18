import 'package:estudar_app/widgets/colorpick_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova Atividade"),
          centerTitle: true,
        ),
        body: Center(
            child: Text("Teste"),
        )

    );
  }


}
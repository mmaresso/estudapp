import 'package:estudar_app/widgets/custom_drawer.dart';
import 'package:estudar_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {

  final PageController controller;

  HomeTab(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(controller),
      body: HeaderWidget("NOTÍCIAS",
        Center(
        child: Text("Texto de exemplo"),
        ),
      ),
    );
  }
}
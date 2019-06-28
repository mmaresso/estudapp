import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudar_app/tiles/news_tile.dart';
import 'package:estudar_app/widgets/custom_drawer.dart';
import 'package:estudar_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatelessWidget {

  final PageController controller;

  HomeTab(this.controller);
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: CustomDrawer(controller),
      body: HeaderWidget("NOTÍCIAS",
       FutureBuilder<QuerySnapshot>(
          future:Firestore.instance.collection("news").getDocuments(),
          builder: (context, snapshot){
                  if(!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  else{
                    
                    return _createListNews(context, snapshot);
                  }

          },
        )
      ),
       

      
    );
  }

  Widget _createListNews(BuildContext context, AsyncSnapshot snapshot){
    List<DocumentSnapshot> values = snapshot.data.documents;
    return ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, index){if(!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  else{
                    
                    DocumentSnapshot doc = snapshot.data.documents[index];
                    return GestureDetector(
                      child:NewsTile(snapshot: doc),
                       onTap: () async {
                         if (await canLaunch(doc.data["link"])) {
                            await launch(doc.data["link"]);
                          } else {
                            throw 'Não disponível no momento';
                          }
                       },
                      );
                  }
        },
        );
  }

}
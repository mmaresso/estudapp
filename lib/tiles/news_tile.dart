import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:estudar_app/datas/news_data.dart';

class NewsTile extends StatefulWidget {
  NewsTile({Key key, this.news, this.snapshot}) : super(key: key);
  final DocumentSnapshot snapshot;
  final News news;

  _NewsTilState createState() => _NewsTilState(news, snapshot);
}

class _NewsTilState extends State<NewsTile> {
  DocumentSnapshot snapshot;
  News news;

  _NewsTilState(this.news, this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 0),
      child: Material(
          borderRadius: BorderRadius.circular(6.0),
          elevation: 2.0,
          child: Container(
            height: 120.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInImage.assetNetwork(
                    placeholder: '',
                    image: snapshot.data["url"],
                    fit: BoxFit.fill,
                    width: 120.0,
                    height: 120.0),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot.data["tittle"],
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data["data"],
                        style:
                            new TextStyle(color: Colors.grey, fontSize: 10.0),
                      ),
                      Container(
                        margin: new EdgeInsets.only(top: 5.0),
                        child: new Text(
                          snapshot.data["text"],
                          maxLines: 3,
                        ),
                      ),
                      Container(
                        //margin: new EdgeInsets.only(left:75.0),
                        child: new Text("Leia mais...", style: TextStyle(color: Colors.indigoAccent),
                          
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          )),
    );
  }
}

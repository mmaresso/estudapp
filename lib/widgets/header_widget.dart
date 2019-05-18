import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {

  final String headerText;
  final Widget widgetBody;
  HeaderWidget(this.headerText,this.widgetBody );

  @override
  Widget build(BuildContext context) {
    Widget headerW() => NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 100.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,

                title: Text(headerText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontFamily: "Chawp"

                      )) ,
                background: Image.network(
                  "https://cdn.pixabay.com/photo/2015/12/01/15/43/black-1072366_960_720.jpg",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: widgetBody
    );
    return headerW();
  }
}

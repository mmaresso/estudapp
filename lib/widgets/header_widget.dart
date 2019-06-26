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
            //backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 30.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,

                title: Text(headerText,
                     /*  style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontFamily: "Chawp"

                      ) */) ,
                      
               ),
          ),
        ];
      },
      body: widgetBody
    );
    return headerW();
  }
}

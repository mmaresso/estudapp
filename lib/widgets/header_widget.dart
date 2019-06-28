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
            expandedHeight: 70.0,
            floating: false,
            pinned: true,
            forceElevated: true,
            elevation: 16.0,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,

                title:  Container(  child: Text(headerText,
                     /*  style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontFamily: "Chawp"

                      ) */) ,)
                      
               ),
          ),
        ];
      },
      body: widgetBody
    );
    return headerW();
  }
}

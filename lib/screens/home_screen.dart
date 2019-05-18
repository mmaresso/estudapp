
import 'package:estudar_app/models/subject_model.dart';
import 'package:estudar_app/models/user_model.dart';
import 'package:estudar_app/tabs/checklist_tab.dart';
import 'package:estudar_app/tabs/statistic_tab.dart';
import 'package:estudar_app/tabs/stopwatch_tab.dart';
import 'package:estudar_app/tabs/subjects_tab.dart';
import 'package:estudar_app/tabs/home_tab.dart';
import 'package:estudar_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'activity_screen.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();
  UserModel user;

  HomeScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
       Scaffold(
         drawer: CustomDrawer(_pageController),

         floatingActionButton: FloatingActionButton(
           onPressed: (){
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context)=> ActivityScreen()));
           },
           child: Icon(FontAwesomeIcons.pencilAlt, size: 30.0,),
         ),
         body:  HomeTab(_pageController),
       ),
       Scaffold(
         drawer: CustomDrawer(_pageController),
         body:  ScopedModelDescendant<SubjectModel>(
             builder: (context, child, model){
               return SubjectsTab(_pageController,user);
             })
         ,
       ),
       Scaffold(
         drawer: CustomDrawer(_pageController),
         body:  ScopedModelDescendant<SubjectModel>(
             builder: (context, child, model){
               return StopWatchTab(_pageController,user);
             })
         ,
       ),
       
       Scaffold(
         drawer: CustomDrawer(_pageController),
         body:  ScopedModelDescendant<SubjectModel>(
             builder: (context, child, model){
               return StatisticTab(_pageController,user);
             })
         ,
       ),
       Scaffold(
         drawer: CustomDrawer(_pageController),
         body:  ScopedModelDescendant<SubjectModel>(
             builder: (context, child, model){
               return CheckListTab(_pageController,user);
             })
         ,
       ),


      ],
    );
  }
}


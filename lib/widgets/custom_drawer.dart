import 'package:estudar_app/screens/login_screen.dart';
import 'package:estudar_app/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:estudar_app/models/user_model.dart';

class CustomDrawer extends StatelessWidget {


  final PageController pageController;
  final premium = true;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 16.0),
            children: <Widget>[
              ScopedModelDescendant<UserModel>(
                builder: (context, child, model){
                  return Stack(
                    children: <Widget>[
                      Container(
                        height: 160.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [const Color(0xFF3A4256),
                                     const Color(0xFF718792),],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, left: 16.0),
                        // alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 42.0,
                          backgroundImage: NetworkImage("https://images.pexels.com/photos/634021/pexels-photo-634021.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(26.0, 110.0, 160.0, 10),
                        child: Text("Olá, ${!model.isLoggedIn()? "visitante": model.userData["name"]}! \n", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(260.0, 20.0, 0.0, 10),
                        child: premium == true ? Icon(FontAwesomeIcons.themeco, color: Colors.white, size: 32.0,): Text(""),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(165.0, 130.0, 0.0, 0),
                          child: Text(!model.isLoggedIn() ?"Entrar/Cadastrar" : "                       Sair", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                        ),
                        onTap: (){
                          if(!model.isLoggedIn()){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                          }
                            else {
                              model.signOut();
                              Navigator.of(context).pop();
                            }
                          }


                      )
                    ],
                  );
                },
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 10.0),
                child: Text("ATIVIDADES", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey),),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: DrawerTile(FontAwesomeIcons.newspaper, "Notícias", pageController, 0),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: DrawerTile(FontAwesomeIcons.book, "Disciplinas", pageController, 1),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: DrawerTile(FontAwesomeIcons.chartBar, "Estatísticas", pageController, 3),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 10.0),
                child: Text("FERRAMENTAS", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey),),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: DrawerTile(FontAwesomeIcons.tasks, "Checklist", pageController, 5),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: DrawerTile(FontAwesomeIcons.stopwatch, "Cronômetro", pageController,2),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 10.0),
                child: Text("ASSINANTE", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey),),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: DrawerTile(FontAwesomeIcons.userPlus, "Versão Plus", pageController, 4),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: DrawerTile(FontAwesomeIcons.userCog, "Configurações", pageController, 7),
              ),
              Divider(),

            ],

          )
        ],
      ),
    );
  }
}

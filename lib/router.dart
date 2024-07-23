import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/featutres/auth/screens/auth_screen.dart';
import 'package:amazon/featutres/home/screens/home_screens.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute (RouteSettings routeSettings)
{
switch (routeSettings.name){
case AuthScreen.routeName:
return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=> const AuthScreen(),);


  case HomeScreen.routeName:
return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=> const HomeScreen(),);

  case BottomBar.routeName:
return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=> const BottomBar(),);

  default : 
  return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=> const Scaffold(
    body: Center(
      child: Text("Error"),
    ),
  ),);

}
}
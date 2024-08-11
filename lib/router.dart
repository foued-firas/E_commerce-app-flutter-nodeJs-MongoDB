import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/featutres/admin/screens/add_product_screen.dart';

import 'package:amazon/featutres/auth/screens/auth_screen.dart';
import 'package:amazon/featutres/home/screens/category_deals_screen.dart';
import 'package:amazon/featutres/home/screens/home_screens.dart';
import 'package:amazon/featutres/search/screen/search_screen.dart';
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
  builder: (_)=> const BottomBar(),
  );

  case AddProductScreen.routeName:
return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=> const AddProductScreen(),
  
  );
  case SearchScreen.routeName:
var searchQuery = routeSettings.arguments as String;
return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=>  SearchScreen(searchQuery: searchQuery),
  
  );
  case CategoryDealsScreen.routeName:
    var category = routeSettings.arguments as String;
return MaterialPageRoute(

  settings: routeSettings,
  builder: (_)=>  CategoryDealsScreen(
    category:category ,
  ),
  
  );

  default : 
  return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=> const Scaffold(
    body: Center(
      child: Text("Error"),
    ),
  ),
  );

}
}
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/auth/screens/auth_screen.dart';
import 'package:amazon/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: ThemeData(
       scaffoldBackgroundColor: GlobalVariables.backgroundColor,
       colorScheme:  ColorScheme.light(
        primary: GlobalVariables.secondaryColor,
       ),
        appBarTheme: const AppBarTheme(
          color: GlobalVariables.secondaryColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:  AuthScreen(),
    );
  }
}

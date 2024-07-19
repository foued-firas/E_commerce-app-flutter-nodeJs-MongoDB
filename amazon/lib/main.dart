import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/featutres/auth/screens/auth_screen.dart';
import 'package:amazon/featutres/auth/services/auth_services.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(providers:[
    ChangeNotifierProvider(
      create: (context)=> UserProvider(),),
  ],child:  MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState(){
    super.initState();
    
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: ThemeData(
       scaffoldBackgroundColor: GlobalVariables.backgroundColor,
       colorScheme:  const ColorScheme.light(
        primary: GlobalVariables.secondaryColor,
       ),
        appBarTheme: const AppBarTheme(
         
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:  const AuthScreen(),
    );
  }
}

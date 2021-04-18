import 'package:flutter/material.dart';
import 'package:partyapp/views/login.dart';
import 'package:partyapp/views/navigationBar.dart';
import 'package:partyapp/views/register.dart';
import 'package:partyapp/views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,

//home:RecommendRecipe(),);
        //initialRoute: MyNavigationBar.id,

        initialRoute: Splash.id,
        routes: {
          Splash.id:(context)=>Splash(),
          Login.id:(context)=>Login(),
          Register.id:(context)=>Register(),
          MyNavigationBar.id: (context) => MyNavigationBar(),
          //LoginScreen.id: (context)=> LoginScreen(),
          //RegisterClient.id: (context)=> RegisterClient(),



        }
    );
  }
}
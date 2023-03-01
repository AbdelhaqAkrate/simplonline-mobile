import 'package:flutter/material.dart';
import 'package:simplonline/pages/Home.dart';
import 'package:simplonline/pages/Login.dart';
import 'package:simplonline/pages/Signup.dart';

import '/Utilities/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        MyRoutes.homeScreen: (context) => Home(),
        MyRoutes.loginScreen: (context) => Login(),
        MyRoutes.signUp: (context) => SignUp(),
      },
    );
  }
}

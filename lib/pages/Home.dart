import 'package:flutter/material.dart';
import 'package:simplonline/pages/Apprenant_Screen.dart';
import 'package:simplonline/pages/Briefs_Screen.dart';
import 'package:simplonline/pages/Group_Screen.dart';
import './Login.dart';
import './Signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;
  final List<Widget> myPages = [
    const Briefs(),
    const Apprenants(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: myPages[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              myIndex = value;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: const Icon(Icons.assignment),
              label: 'Briefs',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.group),
              label: 'Apprenants',
            ),
          ]),
    );
  }
}

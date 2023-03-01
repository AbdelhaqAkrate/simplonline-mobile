import 'package:flutter/material.dart';
import 'package:simplonline/constants.dart';
import 'package:simplonline/pages/Login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simplonline/pages/Signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _showSignup = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        AnimatedPositioned(
          duration: defaultDuration,
          width: _size.width * 0.88,
          height: _size.height,
          left: _showSignup ? -_size.width * 0.76 : 0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showSignup = !_showSignup;
              });
            },
            child: Container(
              color: login_bg,
              child: Login(),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: defaultDuration,
          height: _size.height,
          width: _size.width * 0.88,
          left: _showSignup ? _size.width * 0.12 : _size.width * 0.88,
          child: Container(
            color: signup_bg,
            child: SignUp(),
          ),
        ),
        Positioned(
          bottom: _size.height * 0.3,
          left: _size.width * 0.44 - 80,
          child: Container(
            width: 160,
            color: Colors.white,
            child: Text(
              "Login".toUpperCase(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

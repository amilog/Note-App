import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Image.asset(
          "assets/backgraund.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
                height: 280,
                width: 320,
                child: Center(
                  child: Column(
                    children: const [
                      TextField(

            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "First Name",
            ),
            //controller: controller,
          ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

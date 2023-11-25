import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Page/HomePage.dart';
import 'package:project_akhir_mobile/Page/LoginPage.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              LoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}

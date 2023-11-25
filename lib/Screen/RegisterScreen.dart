import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Page/LoginPage.dart';
import 'package:project_akhir_mobile/Page/RegisterPage.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              RegisterPage(),
            ],
          ),
        ),
      ),
    );
  }
}

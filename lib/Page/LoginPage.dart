import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/BottomNavbar.dart';

import '../Component/CommonField.dart';
import '../Component/CustomTextButton.dart';
import '../Component/DefaultButton.dart';
import '../Component/PasswordField.dart';
import '../Models/hive_database.dart';
import '../Models/shared_preference.dart';
import '../Screen/RegisterScreen.dart';
import '../Templates/Text.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoldText('LOGIN'),
              SizedBox(
                height: 50,
              ),
              CommonTextField(label: 'Username*', controller: _username),
              SizedBox(
                height: 25,
              ),
              PasswordField(controller: _password),
              SizedBox(
                height: 25,
              ),
              DefaultButton(
                label: 'Login',
                onPressed: () {
                  _processLogin(_username.text, _password.text);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum Punya Akun?'),
                  CustomTextButton(
                      label: 'Daftar disini',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;

    // Retrieve the hashed password from your database or storage based on the username
    String? hashedPassword = _hive.getHashedPassword(username);

    if (hashedPassword != null) {
      // Compare the provided password with the hashed password using bcrypt's comparePassword method
      found = _hive.checkLogin(username, hashedPassword);
      bool isPasswordMatch =
      await _hive.comparePassword(password, hashedPassword);

      print(hashedPassword);
      if (isPasswordMatch) {
        found = true;
      }
    }
    if (!found) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username dan Password Anda Salah!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Jika login berhasil, panggil setLogin dari SharedPreference
      SharedPreference().setLogin(username);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Berhasil!'),
          backgroundColor: Color.fromARGB(255, 54, 101, 244),
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavbar(),
        ),
      );
    }
  }
}

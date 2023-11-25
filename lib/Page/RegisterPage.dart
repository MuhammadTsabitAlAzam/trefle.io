import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/BottomNavbar.dart';
import 'package:project_akhir_mobile/Screen/LoginScreen.dart';
import '../Component/CommonField.dart';
import '../Component/CustomTextButton.dart';
import '../Component/DefaultButton.dart';
import '../Component/PasswordField.dart';
import '../Models/hive_database.dart';
import '../Models/user.dart';
import '../Templates/Text.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final HiveDatabase _hive = HiveDatabase();

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
              BoldText('REGISTER'),
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
                label: 'Register',
                onPressed: () {
                  if (_username.text.isNotEmpty && _password.text.isNotEmpty) {
                    final String hashedPassword =
                    BCrypt.hashpw(_password.text, BCrypt.gensalt());
                    print(hashedPassword);
                    _hive.addData(
                        DataModel(username: _username.text, password: hashedPassword));

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah Punya Akun?'),
                  CustomTextButton(
                      label: 'Masuk disini',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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
}

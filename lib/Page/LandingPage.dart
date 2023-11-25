import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/BottomNavbar.dart';
import 'package:project_akhir_mobile/Templates/Text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Component/DefaultButton.dart';
import '../Screen/LoginScreen.dart';
import '../Screen/RegisterScreen.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Future<bool> hasTokenFuture;

  @override
  void initState() {
    super.initState();
    // Memanggil fungsi untuk mengecek apakah token tersimpan
    hasTokenFuture = checkToken();
  }

  Future<bool> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Mengecek apakah token tersimpan atau tidak
    bool isTokenAvailable = prefs.getBool('isLogin') ?? false;
    return isTokenAvailable;
  }

  void navigateToNextScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavbar()),
    );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Center(
          child: FutureBuilder<bool>(
            future: hasTokenFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                if (snapshot.data == true) {
                  navigateToNextScreen();
                  return CircularProgressIndicator();
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img.png',
                        width: 231,
                        height: 181,
                      ),
                      SizedBox(height: 50,),
                      GreenBoldText('Plant Pedia'),
                      SizedBox(height: 50),
                      DefaultButton(
                        label: 'Login',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      DefaultButton(
                        label: 'Register',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                      ),
                    ],
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

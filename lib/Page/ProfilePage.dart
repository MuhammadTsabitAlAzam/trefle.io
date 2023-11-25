import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:project_akhir_mobile/Screen/LandingScreen.dart';
import 'package:project_akhir_mobile/Templates/Text.dart';
import '../Component/ConfirmationMessage.dart';
import '../Models/shared_preference.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void dispose() {
    // Dispose sumber daya atau lakukan pembersihan jika diperlukan
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: size.height / 10,
            backgroundImage: AssetImage('assets/img_1.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width-100,
                child: FutureBuilder<String>(
                  future: SharedPreference().getUsername(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      String username = snapshot.data ?? 'notFound';
                      return BoldText2(username);
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 75,
            width: MediaQuery.of(context).size.width - 36,
            child: ElevatedButton(
              onPressed: () async {
                bool? _logout = await ConfirmationMessage.showConfirmationDialog(
                    context,
                    'Logout',
                    'Apakah Anda Yakin Ingin Logout ?',
                    'Ya'
                );
                if (_logout == true){
                  SharedPreference().setLogout();
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: LandingScreen(),
                    withNavBar: false,
                  );
                }
              },
              child: WhiteTitleText('Logout'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            //child: Image.asset('assets/right-arrow.png'),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

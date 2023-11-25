import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Page/ProfilePage.dart';

import '../Templates/Text.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
        title: WhiteTitleText('Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ProfilePage(),
            ],
          ),
        ),
      ),
    );
  }
}

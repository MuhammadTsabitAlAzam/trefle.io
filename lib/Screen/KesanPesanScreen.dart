import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Page/HomePage.dart';
import 'package:project_akhir_mobile/Page/KesanPesanPage.dart';
import 'package:project_akhir_mobile/Templates/Text.dart';

class KesanPesanScreen extends StatefulWidget {
  KesanPesanScreen({Key? key}) : super(key: key);

  @override
  State<KesanPesanScreen> createState() => _KesanPesanScreenState();
}

class _KesanPesanScreenState extends State<KesanPesanScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: WhiteTitleText('Kesan dan Pesan'),
        backgroundColor: Colors.green.shade900,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              KesanPesanPage(),
            ],
          ),
        ),
      ),
    );
  }
}

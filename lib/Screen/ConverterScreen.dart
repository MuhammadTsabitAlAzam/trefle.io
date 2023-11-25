import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Page/ConverterPage.dart';

import '../Templates/Text.dart';

class ConverterScreen extends StatefulWidget {
  ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
        title: WhiteTitleText('Money & Time Conversion'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ConverterPage(),
            ],
          ),
        ),
      ),
    );
  }
}

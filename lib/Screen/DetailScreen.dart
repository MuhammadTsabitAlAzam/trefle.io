import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Page/DetailPage.dart';
import 'package:project_akhir_mobile/Templates/Text.dart';

class DetailScreen extends StatefulWidget {
  final String links;
  DetailScreen({required this.links});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade900,
        title: WhiteTitleText('Plant Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DetailPage(links : widget.links),
            ],
          ),
        ),
      ),
    );
  }
}

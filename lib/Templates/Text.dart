import 'package:flutter/material.dart';

Widget TitleText(String title) => Text(
  title,
  style: TextStyle(
    // fontFamily: '',
      fontSize: 17,
      color: Colors.grey.shade700,
      fontWeight: FontWeight.w700),
);

Widget WhiteTitleText(String title) => Text(
  title,
  style: TextStyle(
    // fontFamily: '',
      fontSize: 17,
      color: Colors.white,
      fontWeight: FontWeight.w700),
);

Widget BoldText(String title) => Text(
  title,
  style: TextStyle(
    // fontFamily: '',
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w900),
);

Widget GreenBoldText(String title) => Text(
  title,
  style: TextStyle(
    // fontFamily: '',
      fontSize: 30,
      color: Colors.green.shade900,
      fontWeight: FontWeight.w900),
);

Widget BoldText2(String title) => Text(
  title,
  textAlign: TextAlign.center,
  style: TextStyle(
    // fontFamily: '',
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w900),
);

Widget Subtitle(String title) => Text(
  title,
  style: TextStyle(
    // fontFamily: '',
    fontStyle: FontStyle.italic,
      fontSize: 14,
      color: Colors.green,
      fontWeight: FontWeight.w100),
);

Widget CommonText(String title) => Text(
  title,
  style: TextStyle(
    // fontFamily: '',
      fontSize: 14,
      color: Colors.black,),
);

Widget KesanPesanText(String title) => Text(
  title,
  style: TextStyle(
    // fontFamily: '',
    fontSize: 16,
    color: Colors.black,),
);

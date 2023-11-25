import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_akhir_mobile/Screen/HomeScreen.dart';
import 'package:project_akhir_mobile/Screen/LandingScreen.dart';

import 'Models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LandingScreen(),
    );
  }
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}
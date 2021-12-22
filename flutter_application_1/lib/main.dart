import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kadent',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFF6E6D9),
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Kadent notificaciones"),
          ),
          body: const HomePage()),
    );
  }
}

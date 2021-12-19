import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFF6E6D9),
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Kdent notificaciones"),
          ),
          body: const HomePage()),
    );
  }
}

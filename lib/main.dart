import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_example/screens/home.dart';
import 'package:flutter_unity_widget_example/screens/3d_page.dart';

import 'menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Unity Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/unity': (context) => OrientationScreen(),
      },
    );
  }
}

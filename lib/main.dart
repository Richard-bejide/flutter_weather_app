import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Weather app',
      home: LoadingScreen(),

      theme: ThemeData.dark(),
      
    );
  }
}
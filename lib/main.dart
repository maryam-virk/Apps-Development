import 'package:flutter/material.dart';
import 'signin.dart';
import 'splash.dart';
void main() => runApp(
  MaterialApp(home: MyApp(),)
  );

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Splashpage(),
    );
  }
}

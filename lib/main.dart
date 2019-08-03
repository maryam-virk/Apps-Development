import 'package:flutter/material.dart';
import 'signin.dart';

void main() => runApp(
  MaterialApp(home: MyApp(),)
  );

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:SignInClass(),
    );
  }
}

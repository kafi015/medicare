import 'package:flutter/material.dart';
import 'package:medicare/screens/homepage.dart';
import 'package:medicare/screens/login.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage(),

    );
  }
}

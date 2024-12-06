import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uts_flutter/screens/auth/login_page.dart';
import 'package:uts_flutter/screens/auth/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      initialRoute: '/',
      routes: {
        '/':(context)=>LoginPage(),
        '/Register':(context)=>RegisterPage(),
      },
    );
  }
}
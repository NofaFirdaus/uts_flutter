import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/screens/auth/login_page.dart';
import 'package:uts_flutter/screens/auth/register_page.dart';
import 'package:uts_flutter/app/services/database.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final Database user = Database();

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>LoginPage(user : user),
        '/Register':(context)=>RegisterPage(user:user),
      },
    );
  }
}
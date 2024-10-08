import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/screens/home/home_page.dart';

class LoginController {
  final User user ;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginController({required this.user});
  void login (BuildContext context){
    // String username = usernameController.text;
    // String password = passwordController.text;
    Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage(user: user)));
  }
}
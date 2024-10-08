import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  void login (){
    String username = usernameController.text;
    String password = passwordController.text;
    print(username);
    print(password);
  }
}
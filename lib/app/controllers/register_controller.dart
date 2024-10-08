import 'package:flutter/material.dart';

class RegisterController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  void register(){
    String username = usernameController.text;
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    print('${username} ${name} ${email} ${password}');
  }
}
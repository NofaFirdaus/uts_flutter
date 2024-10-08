import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/app/services/regex_register.dart';

class RegisterController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  User? user;
  void register(){
    final RegexRegister regexRegister =RegexRegister(); 
    String username = usernameController.text;
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

   
    bool validatorEmail= regexRegister.regexEmail.hasMatch(email) && email.split('@').first.length > 3;
    bool validatorUsername= regexRegister.regexUsername.hasMatch(username) ;
    bool validatorName= regexRegister.regexName.hasMatch(name) ;
    bool validatorPassword= regexRegister.regexPassword.hasMatch(password) && password.length > 7;

    print('${validatorName} ${validatorUsername}  ${validatorEmail}  ${validatorPassword}');
    if (validatorName && validatorEmail && validatorUsername && validatorPassword) {
      user = User(name: name,username: username,email: email ,password: password);
    }else{
      print('Gagal Total');
    }
  }
}
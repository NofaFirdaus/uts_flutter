import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/app/services/database.dart';
import 'package:uts_flutter/screens/home/home_page.dart';

class LoginController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login(Database database, BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    User? user = database.authenticate(username, password);
    user != null
        ? Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage(user : user)))
        : print('hello');
  }
}

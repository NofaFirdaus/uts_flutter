import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/app/services/database.dart';
import 'package:uts_flutter/screens/home/home_page.dart';

class LoginController {
  final TextEditingController usernameOrUsernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login(Database database, BuildContext context) {
    database.show();
    String usernameOrUsername = usernameOrUsernameController.text;
    String password = passwordController.text;
    User? user = database.authenticate(usernameOrUsername : usernameOrUsername, password: password);
    print(user);
    user != null
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)))
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Peringatan'),
                content:
                    Text('Username atau password tidak ditemukan. Coba lagi?'),
                actions: [
                  Center(
                      child: SizedBox(
                        width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Tutup'),
                    ),
                  ))
                ],
              );
            });
  }
}

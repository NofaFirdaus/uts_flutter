import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/app/services/database.dart';
import 'package:uts_flutter/app/services/regex_register.dart';

class RegisterController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void register(Database database, BuildContext context) {
    final RegexRegister regexRegister = RegexRegister();
    String username = usernameController.text;
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    bool validatorEmail = regexRegister.regexEmail.hasMatch(email) &&
        email.split('@').first.length > 3;
    bool validatorUsername = regexRegister.regexUsername.hasMatch(username);
    bool validatorName = regexRegister.regexName.hasMatch(name);
    bool validatorPassword =
        regexRegister.regexPassword.hasMatch(password) && password.length > 7;

    database.isUsernameEmailTaken(username, email);
    // print('${validatorName} ${validatorUsername}  ${validatorEmail}  ${validatorPassword}');
    if (validatorName &&
        validatorEmail &&
        validatorUsername &&
        validatorPassword) {
      database.create(User(
          name: name, username: username, email: email, password: password));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Berhasil'),
            content: const Text('Akun berhasil dibuat.'),
            actions: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); 
                    },
                    child: const Text('Tutup'),
                  ),
                ),
              ),
            ],
          );
        },
      ).then((_) => Navigator.pop(context));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Peringatan'),
              content: const Text('Akun gagal dibuat.'),
              actions: [
                Center(
                    child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Tutup'),
                  ),
                ))
              ],
            );
          });
    }
  }
}

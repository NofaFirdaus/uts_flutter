import 'package:flutter/material.dart';
import 'package:uts_flutter/app/controllers/register_controller.dart';
import 'package:uts_flutter/app/services/database.dart';
import 'package:uts_flutter/app/services/regex_register.dart';

class RegisterPage extends StatefulWidget {
  final Database user;
  RegisterPage({super.key,required this.user });
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  RegexRegister _regex = RegexRegister();
  bool _isErrorName = false;
  bool _isErrorUsername = false;
  bool _isErrorEmail = false;
  bool _isErrorPassword = false;
  final RegisterController _registerPage = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _registerPage.nameController,
                onChanged: (value) {
                  setState(() {
                    _isErrorName = _regex.regexName.hasMatch(value);
                  });
                },
                decoration: InputDecoration(
                    enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                    errorText: _isErrorName ? null : 'Nama tidak valid.',
                    labelText: 'Nama',
                    labelStyle: TextStyle(color:_isErrorName ? Colors.green :null ),
                    border: const OutlineInputBorder()),
                    style: TextStyle(color: _isErrorName ?Colors.black : Colors.red[900]  ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _registerPage.usernameController,
               onChanged: (value) {
                  setState(() {
                    _isErrorUsername = _regex.regexUsername.hasMatch(value);
                  });
                },
                decoration: InputDecoration(
                    enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                    errorText: _isErrorUsername ? null : 'Username tidak valid.',
                    labelText: 'Username',
                    labelStyle: TextStyle(color:_isErrorUsername ? Colors.green :null ),
                    border: const OutlineInputBorder()),
                    style: TextStyle(color: _isErrorUsername ?Colors.black : Colors.red[900]  ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _registerPage.emailController,
                   onChanged: (value) {
                  setState(() {
                    _isErrorEmail = _regex.regexEmail.hasMatch(value);
                  });
                },
                 decoration: InputDecoration(
                    enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                    errorText: _isErrorEmail ? null : 'Email tidak valid.',
                    labelText: 'Email',
                    labelStyle: TextStyle(color:_isErrorEmail ? Colors.green :null ),
                    border: const OutlineInputBorder()),
                    style: TextStyle(color: _isErrorEmail ?Colors.black : Colors.red[900]  ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _registerPage.passwordController,
                   onChanged: (value) {
                  setState(() {
                    _isErrorPassword= _regex.regexPassword.hasMatch(value) && value.length > 7;
                  });
                },
                 decoration: InputDecoration(
                    enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                      focusedBorder:const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                    errorText: _isErrorPassword ? null : 'Password tidak valid.',
                    labelText: 'Password',
                    labelStyle: TextStyle(color:_isErrorPassword ? Colors.green :null ),
                    border: const OutlineInputBorder()),
                    style: TextStyle(color: _isErrorPassword ?Colors.black : Colors.red[900]  ),
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, '/');
                  },
                  child: const Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    _registerPage.register(widget.user, context);
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}

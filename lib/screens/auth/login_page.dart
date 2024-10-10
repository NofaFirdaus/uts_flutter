import 'package:flutter/material.dart';
import 'package:uts_flutter/app/controllers/login_controller.dart';
import 'package:uts_flutter/app/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key,});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final LoginController _loginController = LoginController(user: User());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 24),
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
                  controller: _loginController.usernameController,
                  decoration: const InputDecoration(
                      labelText: 'Username atau Email', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                 TextField(
                  
                  controller: _loginController.passwordController,
                  decoration: const  InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: (){Navigator.pushNamed(context, '/Register');}, child: Text('Register')),
                ElevatedButton(onPressed: () {_loginController.login(context);}, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

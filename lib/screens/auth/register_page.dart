import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uts_flutter/app/controllers/register_controller.dart';
import 'package:uts_flutter/app/services/custom_colors.dart';
import 'package:uts_flutter/app/services/database.dart';
import 'package:uts_flutter/app/services/regex_register.dart';

class RegisterPage extends StatefulWidget {
  final Database user;
  RegisterPage({super.key, required this.user});
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  final RegexRegister _regex = RegexRegister();
  bool _isErrorName = false;
  bool _isErrorUsername = false;
  bool _isErrorEmail = false;
  bool _isErrorPassword = false;
  final RegisterController _registerPage = RegisterController();
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/register.svg',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Register your account",
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                TextField(
                  focusNode: _focusNode1,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusNode2);
                  },
                  controller: _registerPage.nameController,
                  onChanged: (value) {
                    setState(() {
                      _isErrorName = _regex.regexName.hasMatch(value);
                    });
                  },
                  decoration: InputDecoration(
                      errorText: _isErrorName ? null : 'Nama tidak valid.',
                      labelText: 'Nama',
                      labelStyle: TextStyle(
                          color: _isErrorName ? CustomColors.portGore900 : null,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                  style: TextStyle(
                      color: _isErrorName ? Colors.black : Colors.red[900]),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  focusNode: _focusNode2,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusNode3);
                  },
                  controller: _registerPage.usernameController,
                  onChanged: (value) {
                    setState(() {
                      _isErrorUsername = _regex.regexUsername.hasMatch(value);
                    });
                  },
                  decoration: InputDecoration(
                      errorText:
                          _isErrorUsername ? null : 'Username tidak valid.',
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: _isErrorUsername
                              ? CustomColors.portGore900
                              : null,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                  style: TextStyle(
                      color: _isErrorUsername ? Colors.black : Colors.red[900]),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _focusNode3,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_focusNode4);
                  },
                  controller: _registerPage.emailController,
                  onChanged: (value) {
                    setState(() {
                      _isErrorEmail = _regex.regexEmail.hasMatch(value);
                    });
                  },
                  decoration: InputDecoration(
                      errorText: _isErrorEmail ? null : 'Email tidak valid.',
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color:
                              _isErrorEmail ? CustomColors.portGore900 : null,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                  style: TextStyle(
                      color: _isErrorEmail ? Colors.black : Colors.red[900]),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  focusNode: _focusNode4,
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: _registerPage.passwordController,
                  onChanged: (value) {
                    setState(() {
                      _isErrorPassword = _regex.regexPassword.hasMatch(value) &&
                          value.length > 7;
                    });
                  },
                  decoration: InputDecoration(
                      errorText:
                          _isErrorPassword ? null : 'Password tidak valid.',
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: _isErrorPassword
                              ? CustomColors.portGore900
                              : null,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      border: const OutlineInputBorder()),
                  style: TextStyle(
                      color: _isErrorPassword ? Colors.black : Colors.red[900]),
                  obscureText: false,
                ),
                Row(
                  children: [
                    Text('Sudah memiliki akun ? '),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: CustomColors.portGore900),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                AbsorbPointer(
                  absorbing: !_isErrorPassword ||
                      !_isErrorName ||
                      !_isErrorEmail ||
                      !_isErrorUsername,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !_isErrorPassword ||
                                  !_isErrorName ||
                                  !_isErrorEmail ||
                                  !_isErrorUsername
                              ? CustomColors.portGore900.withOpacity(0.6)
                              : null,
                        ),
                        onPressed: () {
                          _registerPage.register(widget.user, context);
                        },
                        child: const Text('Submit')),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uts_flutter/app/controllers/login_controller.dart';
import 'package:uts_flutter/app/services/custom_colors.dart';
import 'package:uts_flutter/app/services/database.dart';

class LoginPage extends StatefulWidget {
  final Database user;
  const LoginPage({super.key, required this.user});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();

  bool _isErrorUsernameOrEmail = false;
  bool _isErrorPassword = false;
  bool _isVisible = true;
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/svg/login.svg',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    Text(
                      "Login to your account",
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
                  onChanged: (value) {
                    setState(() {
                      _isErrorUsernameOrEmail = value.isNotEmpty;
                    });
                  },
                  controller: _loginController.usernameOrUsernameController,
                  decoration: InputDecoration(
                      errorText: _isErrorUsernameOrEmail
                          ? null
                          : 'Username harus diisi.',
                      labelStyle: TextStyle(
                          color: _isErrorUsernameOrEmail
                              ? CustomColors.portGore900
                              : null,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      labelText: 'Username atau Email',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  focusNode: _focusNode2,
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    setState(() {
                      _isErrorPassword = value.isNotEmpty;
                    });
                  },
                  controller: _loginController.passwordController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: Icon(
                            _isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _isErrorPassword
                                ? CustomColors.portGore900
                                : Colors.red[900],
                          )),
                      labelStyle: TextStyle(
                          color: _isErrorPassword
                              ? CustomColors.portGore900
                              : null,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      errorText:
                          _isErrorPassword ? null : 'Password harus diisi.',
                      labelText: 'Password',
                      border: const OutlineInputBorder()),
                  obscureText: _isVisible,
                  style: TextStyle(
                      color: _isErrorPassword ? Colors.black : Colors.red[900]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Belum Memiliki akun ? '),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Register');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: CustomColors.portGore900),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                AbsorbPointer(
                  absorbing: !_isErrorPassword || !_isErrorUsernameOrEmail,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              !_isErrorPassword || !_isErrorUsernameOrEmail
                                  ? CustomColors.portGore900.withOpacity(0.6)
                                  : null,
                        ),
                        onPressed: () {
                          _loginController.login(widget.user, context);
                        },
                        child: const Text('Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16))),
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

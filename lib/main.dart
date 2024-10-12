import 'package:flutter/material.dart';
import 'package:uts_flutter/app/services/custom_colors.dart';
import 'package:uts_flutter/screens/auth/login_page.dart';
import 'package:uts_flutter/screens/auth/register_page.dart';
import 'package:uts_flutter/app/services/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Database user = Database();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
              color: CustomColors.portGore900,
              fontWeight: FontWeight.w500,
              fontSize: 14),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.portGore900, width: 2.0)),
                  
          border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
          enabledBorder: OutlineInputBorder(
             borderSide: BorderSide(
              color: CustomColors.portGore900,
              width: 1.0,
            ),
          )
        ),
        
        buttonTheme: const ButtonThemeData(
          buttonColor: CustomColors.portGore900,
          textTheme: ButtonTextTheme.normal,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                textStyle: const TextStyle(
                  color: CustomColors.portGore900,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: CustomColors.portGore900,
                ))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding:  EdgeInsets.symmetric(vertical: 12),
            foregroundColor: Colors.white,
            backgroundColor: CustomColors.portGore900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(user: user),
        '/Register': (context) => RegisterPage(user: user),
      },
    );
  }
}

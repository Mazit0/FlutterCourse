import 'package:flutter/material.dart';
import 'views/screens/form_screen.dart';

void main() => runApp(const LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return const MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: LoginFormScreen()
    );
  }
}


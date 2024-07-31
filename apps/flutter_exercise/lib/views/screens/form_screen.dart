import 'package:flutter/material.dart';
import '../widgets/login_widgets/form.dart';

// Create a Form Screen.
class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForm(),
      backgroundColor:  Color.fromARGB(255, 247, 255, 247),
    );
  }
}


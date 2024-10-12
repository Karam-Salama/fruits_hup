import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup-view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign Up View'),
      ),
    );
  }
}
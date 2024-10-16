import 'package:flutter/material.dart';
import 'bodies/reset_your_password_body.dart';

class ResetyourpasswordView extends StatelessWidget {
  const ResetyourpasswordView({super.key});
  static const String routeName = "/resetPassword-view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetYourPasswordBody(),
    );
  }
}

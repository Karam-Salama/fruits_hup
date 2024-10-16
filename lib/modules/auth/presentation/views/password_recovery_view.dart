import 'package:flutter/material.dart';
import 'bodies/password_recovery_body.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({super.key});
  static const String routeName = "/passwordRecovery-View";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PasswordRecoveryBody(),
    );
  }
}

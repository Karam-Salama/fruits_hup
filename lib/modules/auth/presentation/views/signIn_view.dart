import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/service/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../domain/repos/auth_repo.dart';
import '../auth_cubits/Sign_In_Cubit/sign_in_cubit.dart';
import 'bodies/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = '/login-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.login),
      body: BlocProvider(
        create: (context) => SignInCubit(getIt<AuthRepo>()),
        child: SignInBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/functions/navigation.dart';
import 'package:fruits_hup/modules/auth/presentation/auth_cubits/Sign_Up_Cubit/sign_up_cubit.dart';
import 'package:fruits_hup/modules/auth/presentation/views/signIn_view.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../domain/repos/auth_repo.dart';
import 'bodies/sign_up_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.register,
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          customReplacementNavigate(context, SignInView.routeName);
        },
        leading: SizedBox(),
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt<AuthRepo>()),
        child: SignUpBody(),
      ),
    );
  }
}

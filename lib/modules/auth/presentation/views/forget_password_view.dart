import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/widgets/custom_app_bar_widget.dart';
import 'package:fruits_hup/modules/auth/presentation/auth_cubits/reset_pass_Cubit/reset_password_cubit.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/repos/auth_repo.dart';
import 'bodies/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = '/ForgetPassword-View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.forgottingPassword,
        leading: SizedBox(),
        icon: Icon(Icons.arrow_back_ios_new_rounded),
      ),

      body: BlocProvider(
        create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
        child: ForgetPasswordBody(),
      ),
    );
  }
}

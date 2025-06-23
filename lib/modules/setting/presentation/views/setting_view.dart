import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/modules/setting/presentation/cubit/setting_cubit.dart';
import 'package:fruits_hup/modules/setting/presentation/widgets/setting_view_body.dart';

import '../../../../core/service/service_locator.dart';
import '../../../auth/domain/repos/auth_repo.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SettingCubit(authRepo: getIt<AuthRepo>()),
          child: SettingViewBody(),
        ),
      ),
    );
  }
}

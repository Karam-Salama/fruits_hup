import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/modules/setting/presentation/cubit/setting_states.dart';

import '../../../auth/domain/repos/auth_repo.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit({required this.authRepo}) : super(SettingInitial());
  final AuthRepo authRepo;

  Future<void> signOut() async {
    emit(SignOutLoadingState());
    final result = await authRepo.signOut();
    result.fold(
      (failure) => emit(SignOutErrorState(failure.message)),
      (_) => emit(SignOutSuccessState()),
    );
  }
}

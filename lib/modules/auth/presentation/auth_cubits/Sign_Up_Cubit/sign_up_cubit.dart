import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/modules/auth/domain/repos/auth_repo.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(SignUpErrorState(errorMessage: failure.message)),
      (userEntity) => emit(SignUpSuccessState(userEntity: userEntity)),
    );
  }
}

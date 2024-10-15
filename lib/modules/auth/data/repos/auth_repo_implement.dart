import 'package:dartz/dartz.dart';
import 'package:fruits_hup/core/errors/exceptions.dart';

import 'package:fruits_hup/core/errors/failures.dart';

import 'package:fruits_hup/modules/auth/domain/entities/user_entity.dart';

import '../../../../core/service/service_firebase_auth.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImplement extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplement({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An error occured, please try again later.'));
    }
  }
}

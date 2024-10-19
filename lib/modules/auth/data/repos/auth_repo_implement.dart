import 'dart:developer';

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
      log('Exception in AuthRepoImplementation.createUserWithEmailAndPassword method:  ${e.toString()}');
      return Left(ServerFailure('حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithEmailAndPassword method:  ${e.toString()}');
      return Left(ServerFailure('حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithGoogle method:  ${e.toString()}');
      return Left(ServerFailure('حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithFacebook method:  ${e.toString()}');
      throw ServerFailure('حدث خطاء، يرجى المحاولة مرة اخرى لاحقًا.');
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      var user = await firebaseAuthService.signInWithApple();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithApple method:  ${e.toString()}');
      throw ServerFailure('حدث خطاء، يرجى المحاولة مرة اخرى لاحقًا.');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuthService.signOut();
    } on CustomException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      log('Exception in AuthRepoImplementation.signOut method:  ${e.toString()}');
      throw ServerFailure('حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
    }
  }
}

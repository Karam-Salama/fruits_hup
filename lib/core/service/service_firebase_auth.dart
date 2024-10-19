import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword method:  ${e.toString()} and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور المقدمة ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'يوجد حساب بالفعل بهذا البريد الإلكتروني.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'عنوان البريد الإلكتروني غير صالح.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(message: 'عنوان البريد الإلكتروني غير مسموح به.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من الاتصال بالانترنت.');
      } else {
        throw CustomException(
            message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword method:  ${e.toString()}');
      throw CustomException(message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword method:  ${e.toString()} and code is ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: ' البريد الإلكتروني او الرقم السري غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: ' البريد الإلكتروني او الرقم السري غير صحيح.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'عنوان البريد الإلكتروني غير صالح.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(message: 'حسابك معطل.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(message: 'عنوان البريد الإلكتروني غير مسموح به.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من الاتصال بالانترنت.');
      } else {
        throw CustomException(
            message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword method:  ${e.toString()}');
      throw CustomException(message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle method:  ${e.toString()} and code is ${e.code}');
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
            message: 'يوجد حساب بالفعل بهذا البريد الإلكتروني.');
      } else if (e.code == 'invalid-credential' ||
          e.code == 'operation-not-allowed' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        throw CustomException(
            message: 'حدث خطاء، يرجى المحاولة مرة اخرى لاحقا.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(message: 'حسابك معطل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من الاتصال بالانترنت.');
      } else {
        throw CustomException(
            message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle method: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithFacebook method:  ${e.toString()} and code is ${e.code}');
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
            message: 'يوجد حساب بالفعل بهذا البريد الإلكتروني.');
      } else if (e.code == 'invalid-credential' ||
          e.code == 'operation-not-allowed' ||
          e.code == 'user-not-found' ||
          e.code == 'wrong-password') {
        throw CustomException(
            message: 'حدث خطاء، يرجى المحاولة مرة اخرى لاحقا.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(message: 'حسابك معطل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من الاتصال بالانترنت.');
      } else {
        throw CustomException(
            message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithFacebook method: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ، يرجى المحاولة مرة أخرى لاحقًا.');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

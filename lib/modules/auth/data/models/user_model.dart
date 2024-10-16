import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.uId,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.displayName ?? '',
      name: user.email ?? '',
      uId: user.uid,
    );
  }
}

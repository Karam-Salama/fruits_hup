// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:fruits_hup/core/database/cache/cache_helper.dart';
import 'package:fruits_hup/modules/auth/data/models/user_model.dart';
import 'package:fruits_hup/modules/auth/domain/entities/user_entity.dart';

import '../service/service_locator.dart';

UserEntity getUser() {
  var jsonString = getIt<CacheHelper>().getData(key: 'userData');
  var user = UserModel.fromJson(jsonDecode(jsonString));

  if (user == null) {
    return UserEntity(
      name: '',
      email: '',
      uId: '',
    );
  } else {
    return user;
  }
}
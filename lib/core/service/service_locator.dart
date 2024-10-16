import 'package:fruits_hup/core/service/service_firebase_auth.dart';
import 'package:fruits_hup/modules/auth/data/repos/auth_repo_implement.dart';
import 'package:fruits_hup/modules/auth/domain/repos/auth_repo.dart';

import '../database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplement(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}

import 'package:fruits_hup/core/service/database_service.dart';
import 'package:fruits_hup/core/service/service_firebase_auth.dart';
import 'package:fruits_hup/modules/auth/data/repos/auth_repo_implement.dart';
import 'package:fruits_hup/modules/auth/domain/repos/auth_repo.dart';
import '../database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';
import '../repos/orders_repos/order_repo.dart';
import '../repos/orders_repos/orders_repos_implementation.dart';
import '../repos/products_repos/product_repo.dart';
import '../repos/products_repos/products_repos_implementation.dart';
import 'service_firebase_firestore.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  //! Shared Preferences
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  //! Authentication
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirabaseFirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplement(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  //! Home
  getIt.registerSingleton<ProductRepo>(
      ProductReposImplementation(getIt<DatabaseService>()));

  //! Orders
  getIt.registerSingleton<OrderRepo>(
      OrdersReposImplementation(firestoreService: getIt<DatabaseService>()));
}

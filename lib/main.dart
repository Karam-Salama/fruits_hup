import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hup/firebase_options.dart';
import 'app/fruitHup_app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/functions/check_state_changes_fun.dart';
import 'core/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();
  runApp(const FruitHup());
}

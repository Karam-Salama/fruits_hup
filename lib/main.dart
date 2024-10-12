import 'package:flutter/material.dart';
import 'app/fruitHup_app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const FruitHup());
}

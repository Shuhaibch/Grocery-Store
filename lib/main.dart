import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mechinetest/app.dart';

Future<void> main() async {
  //* widget binding
  // final WidgetsBinding widgetsBinding =
  //     WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  //* Getx Local Storage
  await Hive.initFlutter();
  await Hive.openBox('products');
  await Hive.openBox('cart');
  // await GetStorage.init();

  runApp(const MyApp());
}

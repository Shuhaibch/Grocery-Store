import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mechinetest/app.dart';
import 'package:mechinetest/utils/storage/storage_utility.dart';

Future<void> main() async {
  //* widget binding
  // final WidgetsBinding widgetsBinding =
  //     WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  //* Getx Local Storage
  await GetStorage.init();
  await CLocalStorage.init('cart');
  //* Getx Local Storage
  await Hive.initFlutter();
  await Hive.openBox('products');
  await Hive.openBox('cartBox');
  // await GetStorage.init();

  runApp(const MyApp());
}

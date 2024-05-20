import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mechinetest/binding/general_binding.dart';
import 'package:mechinetest/navigation_menu.dart';

import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Technouroues',
        // themeMode: ThemeMode.system,
        theme: CAppTheme.lightTheme,
        // darkTheme: CAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        // getPages: AppRoutes.pages,
        home: const NavigationMenu() );
  }
}
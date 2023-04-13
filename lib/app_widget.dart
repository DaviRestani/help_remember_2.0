import 'package:flutter/material.dart';
import 'package:help_remember/screens/cadastro_screen.dart';
import 'package:help_remember/screens/diary_screen.dart';
import 'package:help_remember/screens/family_screen.dart';
import 'package:help_remember/screens/food_screen.dart';
import 'package:help_remember/screens/login_screen.dart';
import 'package:help_remember/screens/medicine_screen.dart';
import 'package:help_remember/screens/options_screen.dart';
import 'package:help_remember/screens/phisical_activity_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => LoginScreen(),
        '/cadastro_screen': (context) => CadastroScreen(),
        '/options_list': (context) => const OptionsScreen(),
        '/family_list': (context) => GroupListFamily(),
        '/food_list': (context) => GroupListFood(),
        '/medicine_list': (context) => GroupListMedicine(),
        '/physical_list': (context) => GroupListPhysical(),
        '/diary_page': (context) => GroupListDiary(),
      },
    );
  }
}

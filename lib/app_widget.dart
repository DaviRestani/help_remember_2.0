import 'package:flutter/material.dart';
import 'package:help_remember/screens/add_activitie.dart';
import 'package:help_remember/screens/add_diary.dart';
import 'package:help_remember/screens/add_family_screen.dart';
import 'package:help_remember/screens/add_food.dart';
import 'package:help_remember/screens/add_medicine.dart';
import 'package:help_remember/screens/alimentacao.dart';
import 'package:help_remember/screens/cadastro_screen.dart';
import 'package:help_remember/screens/calendar_page.dart';
import 'package:help_remember/screens/diario.dart';
import 'package:help_remember/screens/games_screen.dart';
import 'package:help_remember/screens/diary_screen.dart';
import 'package:help_remember/screens/ente.dart';
import 'package:help_remember/screens/family_screen.dart';
import 'package:help_remember/screens/food_screen.dart';
import 'package:help_remember/screens/forgot_password_screen.dart';
import 'package:help_remember/screens/login_screen.dart';
import 'package:help_remember/screens/medicine_screen.dart';
import 'package:help_remember/screens/menu_screen.dart';
import 'package:help_remember/screens/phisical_activity_screen.dart';
import 'package:help_remember/screens/remedio.dart';
import 'package:help_remember/screens/treino.dart';
import 'package:help_remember/screens/the_memory_match_game.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => const MenuScreen(),
        '/cadastro_screen': (context) => const CadastroScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/family_list': (context) => GroupListFamily(),
        '/food_list': (context) => GroupListFood(),
        '/medicine_list': (context) => GroupListMedicine(),
        '/physical_list': (context) => GroupListPhysical(),
        '/diary_page': (context) => GroupListDiary(),
        '/games_page': (context) => const GamesScreen(),
        '/add_family_screen': (context) => FamilyCadastroScreen(),
        '/forgot_password_screen': (context) => const ForgotPasswordPage(),
        '/add_medicine': (context) => const AddRemedio(),
        '/add_food': (context) => AddDieta(),
        '/add_activitie': (context) => const AddAtividade(),
        '/calendar_page': (context) => const DemoApp(),
        '/add_diary': (context) => AddDiary(),
        '/edit_phisical': (context) => PhisicalEditScreen(),
        '/edit_medicine': (context) => EditMedicineScreen(),
        '/edit_diary': (context) => EditPhisicalPage(),
        '/edit_family': (context) => EditFamilyPage(),
        '/edit_food': (context) => EditFoodScreen(),
        '/memory_game': (context) => TheMemoryMatchGame()
      },
    );
  }
}

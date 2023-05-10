import 'package:flutter/material.dart';
import 'package:help_remember/ui/pages/startup_page.dart';

class TheMemoryMatchGame extends StatelessWidget {
  const TheMemoryMatchGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StartUpPage(),
      title: 'O jogo da Memória',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

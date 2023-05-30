import 'package:flutter/material.dart';

import 'package:help_remember/ui/pages/memory_match_page.dart';
import 'package:help_remember/ui/widgets/game_button.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.chevron_left),
          ),
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const Center(
                child: Text(
                  'MEMORY MATCH',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              GameButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const MemoryMatchPage();
                  }));
                },
                title: 'START',
              )
            ])));
  }
}

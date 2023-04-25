import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/menu_button.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, //const Color.fromARGB(255, 18, 93, 178),
        title: const Text(
          "Jogos de memória",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const GamesScreenBox(),
    );
  }
}

class GamesScreenBox extends StatelessWidget {
  const GamesScreenBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xffE1E1E1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: const [
                  MenuButton(
                    route: '/game1_list',
                    text: "Colors Games",
                    image: 'assets/icons/memory.png',
                  ),
                  SizedBox(height: 6),
                  MenuButton(
                    route: '/game2_list',
                    text: "Words Game",
                    image: 'assets/icons/memory.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

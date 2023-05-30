import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Menu Principal'),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Família'),
              onTap: () {
                Navigator.of(context).pushNamed('/family_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.medication),
              title: const Text('Remédios'),
              onTap: () {
                Navigator.of(context).pushNamed('/medicine_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_baseball),
              title: const Text('Atividade Fisíca'),
              onTap: () {
                Navigator.of(context).pushNamed('/physical_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text('Diário'),
              onTap: () {
                Navigator.of(context).pushNamed('/diary_page');
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text('Alimentação'),
              onTap: () {
                Navigator.of(context).pushNamed('/food_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.games),
              title: const Text('Jogos'),
              onTap: () {
                Navigator.of(context).pushNamed('/games_page');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue, //const Color.fromARGB(255, 18, 93, 178),
        title: const Text(
          "Jogos de memória",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
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
                    route: '/memory_game',
                    text: "Jogo da memória",
                    image: 'assets/icons/memory.png',
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

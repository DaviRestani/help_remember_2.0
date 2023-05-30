import 'package:flutter/material.dart';
import 'package:help_remember/widgets/menu_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, //const Color.fromARGB(255, 18, 93, 178),
        title: const Text(
          "Menu Principal",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              key: const Key('Person'),
              onPressed: () {
                Navigator.of(context).pushNamed('/login_screen');
              }, // Colocar uma tela que mostra as informações da pessoa que está logada
              tooltip: 'Login',
              icon: const Icon(Icons.person))
        ],
      ),
      body: const MenuPageBox(),
    );
  }
}

class MenuPageBox extends StatelessWidget {
  const MenuPageBox({super.key});

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
                children: [
                  Container(
                    height: 100.0,
                    width: 200.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/icons/help_remember.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const MenuButton(
                    route: '/family_list',
                    text: "Família",
                    image: 'assets/icons/pessoas.png',
                  ),
                  const SizedBox(height: 6),
                  const MenuButton(
                    route: '/medicine_list',
                    text: "Remédios",
                    image: 'assets/icons/remedio.png',
                  ),
                  const SizedBox(height: 6),
                  const MenuButton(
                    route: '/physical_list',
                    text: "Atividades Físicas",
                    image: 'assets/icons/haltere.png',
                  ),
                  const SizedBox(height: 6),
                  const MenuButton(
                    route: '/diary_page',
                    text: "Diário",
                    image: 'assets/icons/diario cópia.png',
                  ),
                  const SizedBox(height: 6),
                  const MenuButton(
                    route: '/food_list',
                    text: "Alimentação",
                    image: 'assets/icons/talheres-de-bebe.png',
                  ),
                  const SizedBox(height: 6),
                  const MenuButton(
                    route: '/games_page',
                    text: "Jogos de Memória",
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

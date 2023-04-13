import 'package:flutter/material.dart';
import 'package:help_remember/widgets/menu_button.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 93, 178),
          title: const Text(
            "Menu Principal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                tooltip: 'Login',
                icon: const Icon(Icons.person))
          ],
        ),
        body: OptionsPageBox(),
      ),
    );
  }
}

class OptionsPageBox extends StatelessWidget {
  const OptionsPageBox({super.key});

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
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        'assets/icons/help_remember.png',
                        width: 200,
                        height: 350,
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
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
                    image: 'assets/icons/pencil.png',
                  ),
                  const SizedBox(height: 6),
                  const MenuButton(
                    route: '/food_list',
                    text: "Alimentação",
                    image: 'assets/icons/frutas.png',
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

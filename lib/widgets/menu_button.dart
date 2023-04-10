import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String route;
  final String text;
  final String image;

  const MenuButton(
      {required this.route, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pushNamed(route),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(355, 100)),
      ),
      child: Row(children: [
        Image.asset(
          image,
          height: 50,
          width: 65,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 23),
        ),
      ]),
    );
  }
}

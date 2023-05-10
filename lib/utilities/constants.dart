import 'package:flutter/material.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const kHintTextStyleCadastro = TextStyle(
  color: Color.fromARGB(137, 0, 0, 0),
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kBoxDecorationStyleCadastro = BoxDecoration(
  color: const Color.fromARGB(255, 255, 255, 255),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
  border: Border.all(
    color: const Color.fromARGB(255, 0, 0, 0),
    width: 1,
  ),
);

final kBoxDecorationStyleText = BoxDecoration(
  color: const Color.fromARGB(255, 255, 255, 255),
  borderRadius: BorderRadius.circular(10.0),
);

final kBoxDecorationStyleText2 = BoxDecoration(
  color: Color.fromARGB(255, 240, 235, 235),
  borderRadius: BorderRadius.circular(10.0),
);

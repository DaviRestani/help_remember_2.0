import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/constants.dart';

void main() {
  runApp(
    MaterialApp(
      home: CadastroScreen(),
    ),
  );
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  bool _rememberMe = false;

  Widget _buildImage() {
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.center, // <-- SEE HERE
            child: Container(
                width: 600,
                height: 200,
                decoration: const BoxDecoration(
                    color: Color(0xFF398AE5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120)))),
          ),
          Positioned(
            right: 80,
            bottom: -13,
            child: Container(
              height: 230.0,
              width: 270.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                image: const DecorationImage(
                  image: AssetImage("icons/brainC.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleCadastro,
          width: 390.0,
          height: 40.0,
          child: const TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Entre com seu Nome',
              hintStyle: kHintTextStyleCadastro,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSexTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleCadastro,
          width: 390.0,
          height: 40.0,
          child: const TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.male,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Entre com seu sexo',
              hintStyle: kHintTextStyleCadastro,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleCadastro,
          width: 390.0,
          height: 40.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Entre com seu E-mail',
              hintStyle: kHintTextStyleCadastro,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyleCadastro,
          width: 390.0,
          height: 40.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Entre com sua Senha',
              hintStyle: kHintTextStyleCadastro,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return SizedBox(
      //padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 250.0,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () => print('Botão Logar'),
        child: Text(
          'REGISTRAR',
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inknut Antiqua',
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF398AE5),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              //SizedBox(height: 30.0),
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    //vertical: 60.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildImage(),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Color(0xFF398AE5),
                          fontFamily: 'Inknut Antiqua',
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Crie sua Conta',
                        style: TextStyle(
                          color: Color(0xFF398AE5),
                          fontFamily: 'Inknut Antiqua',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      _buildNameTF(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      _buildSexTF(),
                      const SizedBox(height: 5.0),
                      _buildEmailTF(),
                      const SizedBox(height: 5.0),
                      _buildPasswordTF(),
                      const SizedBox(height: 15.0),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

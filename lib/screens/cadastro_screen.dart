import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/constants.dart';
import 'package:http/http.dart' as http;

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  //Integração -------------------------------------------------------------------------------------------------------

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerSex = TextEditingController();

  void cadastrarUsuario(
      String name, String email, String password, String sexo) async {
    // URL do backend
    var url = 'http://localhost:8100/create';
    try {
      // Fazendo a requisição HTTP POST para o backend
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "email": password,
          "sexo": sexo,
          "password": email,
          "entes_queridos": [{}],
          "remedios": [{}],
          "atividade_fisicas": [{}],
          "alimentacao": [{}],
          "alarmes": [{}],
        }),
      );

      if (response.statusCode == 200) {
        // Cadastro bem-sucedido
        print('Usuário cadastrado com sucesso!');
      } else {
        // Ocorreu algum erro no cadastro
        print(
            'Erro no cadastro do usuário. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Ocorreu algum erro de conexão
      print('Erro de conexão: $e');
    }
  }

  //Widgets ----------------------------------------------------------------------------------------------------------

  Widget _buildImage() {
    return Container(
      height: 280.0,
      width: 280.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(200),
        image: const DecorationImage(
          image: AssetImage("assets/icons/brainC.png"),
          fit: BoxFit.fill,
        ),
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
          child: TextField(
            controller: _controllerName,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
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
          child: TextField(
            controller: _controllerSex,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
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
          child: TextField(
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
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
          child: TextField(
            controller: _controllerPassword,
            obscureText: true,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
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
        onPressed: () {
          String username = _controllerName.text;
          String password = _controllerPassword.text;
          String email = _controllerEmail.text;
          String sexo = _controllerSex.text;
          cadastrarUsuario(username, password, email, sexo);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF398AE5),
          ),
        ),
        child: const Text(
          'REGISTRAR',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inknut Antiqua',
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

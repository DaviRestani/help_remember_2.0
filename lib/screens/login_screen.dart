import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bin/services/SharedVariablesToken.dart';
import '../utilities/constants.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void fazerLogin(String email, String password) async {
    var url = 'http://localhost:8100/login';
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );
      print(response.body);
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      String token = jsonData['token'];
      print(token);
      if (response.statusCode == 200) {
        // Login bem-sucedido
        print('Login realizado com sucesso!');

        // Obtenha o token do cookie de resposta
        var token = response.headers;
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('token', token as String);
        // Guarde o token localmente (exemplo: usando SharedPreferences)
        //var prefs = await SharedPreferences.getInstance();
        //prefs.setString('token', token!);
        //SharedVariables.token = token as String;
        Navigator.of(context).pop();
      } else {
        // Falha no login
        print('Falha no login. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Erro de conexão
      print('Erro de conexão: $e');
    }
  }

  Widget _buildImage() {
    return Container(
      height: 280.0,
      width: 280.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        image: const DecorationImage(
          image: AssetImage("assets/icons/brain2.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: 390.0,
          height: 60.0,
          child: TextField(
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Entre com seu E-mail',
              hintStyle: kHintTextStyle,
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
          decoration: kBoxDecorationStyle,
          width: 390.0,
          height: 60.0,
          child: TextField(
            controller: _controllerPassword,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Entre com sua Senha',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          print('Esqueceu sua Senha, pressione o botão');
          Navigator.of(context).pushNamed('/forgot_password_screen');
        },
        child: const Text(
          'Esqueceu sua Senha?',
          style: kLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return SizedBox(
      //padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 250.0,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          String password = _controllerPassword.text;
          String email = _controllerEmail.text;
          print("Senha: ${password}");
          fazerLogin(email, password);
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inknut Antiqua',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/cadastro_screen');
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Não tem conta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Cadastrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
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
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
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
                          'Bem-Vindo!',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inknut Antiqua',
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Logue sua Conta',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inknut Antiqua',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        _buildEmailTF(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        const SizedBox(height: 5.0),
                        _buildLoginBtn(),
                        const SizedBox(height: 5.0),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

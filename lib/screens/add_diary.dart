// ignore_for_file: unused_element
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:help_remember/utilities/constants.dart';

class AddDiary extends StatefulWidget {
  AddDiary({Key? key}) : super(key: key);

  @override
  _AddDiaryState createState() => _AddDiaryState();
}

class _AddDiaryState extends State<AddDiary> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  void criarDiario(String nome, String descricao) async {
    Map<String, dynamic> requestBody = {
      'nomeDiario': nome,
      'descricao': descricao,
    };

    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2ODczMDY0MzgsInVzZXJJRCI6Ik9iamVjdElkKFwiNjQ5MjNiMGJjZGY3ZTI0MmI5OTc4MTMwXCIpIn0.Y0BZuCCoJI-7iE-23Lub0VDOlyrwrH34qGs7q_boNps'; // Converte o corpo da requisição em uma string JSON
    String requestBodyJson = jsonEncode(requestBody);
    print(token);

    print(requestBody);
    // URL do endpoint do backend
    String url = 'http://localhost:8100/diary/create/<user>';

    // Cabeçalho da requisição com o token de autenticação
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    print(headers);
    // Envia a solicitação POST para o backend
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: requestBodyJson,
    );

    // Verifica o código de resposta do servidor
    if (response.statusCode == 200) {
      // O remédio foi adicionado com sucesso
      // Faça algo aqui, como mostrar uma mensagem de sucesso ou redirecionar para outra tela
      print('Diário adicionado');
      Navigator.of(context).pop();
    } else {
      // Houve um erro ao adicionar o remédio
      // Exiba uma mensagem de erro ou faça algo apropriado com base na resposta do servidor
      print('Falha ao adicionar o diário. Status code: ${response.statusCode}');
    }
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
            controller: _nome,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.medical_services_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Diário do dia',
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
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          decoration: kBoxDecorationStyleText,
          width: 390.0,
          //height: 100.0,
          child: const Text(
            ' Meu dia de hoje',
            style: TextStyle(
              fontSize: 25.0,
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          decoration: kBoxDecorationStyleText2,
          width: 410.0,
          height: 380.0,
          child: TextField(
            controller: _descricao,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: '   Começei o dia ...',
              hintStyle: kHintTextStyleCadastro,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff1b2c57),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue,
          title: Center(
              child: Column(
            children: const <Widget>[
              Text('Adicionar uma Página ao Diário',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25.0))
            ],
          ))),
      body: Center(
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0xff1b2c57),
          //       Color(0xff1b2c57),
          //       Color.fromARGB(255, 255, 255, 255),
          //       Color.fromARGB(255, 255, 255, 255),
          //     ],
          //     stops: [0.1, 0.5, 0.6, 0.9],
          //   ),
          // ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 5.0,
              ),
              GestureDetector(
                child: Text(
                    '${dia(DateTime.now().weekday)}, ${DateTime.now().day.toString()} de ${mes(DateTime.now().month)} ${DateTime.now().year.toString()}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0))),
              ),
              const SizedBox(
                height: 5.0,
              ),
              _buildPasswordTF(),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: 150, // <-- Your width
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              String nome = _nome.text;
                              String descricao = _descricao.text;
                              criarDiario(nome, descricao);
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF398AE5),
                              ),
                            ),
                            child: const Text(
                              'Salvar',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inknut Antiqua',
                              ),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 20,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[],
          ),
        ),
      ),
    );
  }

  String dia(int weekday) {
    String week = '';

    switch (weekday) {
      case 1:
        week = "Seg";
        break;
      case 2:
        week = "Ter";
        break;
      case 3:
        week = "Qua";
        break;
      case 4:
        week = "Qui";
        break;
      case 5:
        week = "Sex";
        break;
      case 6:
        week = "Sab";
        break;
      case 7:
        week = "Dom";
        break;
    }

    return week;
  }

  String mes(int month) {
    String week = '';

    switch (month) {
      case 1:
        week = "Janeiro";
        break;
      case 2:
        week = "Fevereiro";
        break;
      case 3:
        week = "Março";
        break;
      case 4:
        week = "Abril";
        break;
      case 5:
        week = "Maio";
        break;
      case 6:
        week = "Junho";
        break;
      case 7:
        week = "Julho";
        break;
      case 8:
        week = "Agosto";
        break;
      case 9:
        week = "Setembro";
        break;
      case 10:
        week = "Outubro";
        break;
      case 11:
        week = "Novembro";
        break;
      case 12:
        week = "Dezembro";
        break;
    }

    return week;
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FamilyCadastroScreen extends StatefulWidget {
  @override
  _FamilyCadastroScreenState createState() => _FamilyCadastroScreenState();
}

class _FamilyCadastroScreenState extends State<FamilyCadastroScreen> {
  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  bool _rememberMe = false;

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _contato = TextEditingController();
  final TextEditingController _parentesco = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  void criarPessoa(
      String nome, String contato, String parentesco, String descricao) async {
    Map<String, dynamic> requestBody = {
      'nome': nome,
      'contato': contato,
      'parentesco': parentesco,
      'descricao': descricao
    };

    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2ODczMDY0MzgsInVzZXJJRCI6Ik9iamVjdElkKFwiNjQ5MjNiMGJjZGY3ZTI0MmI5OTc4MTMwXCIpIn0.Y0BZuCCoJI-7iE-23Lub0VDOlyrwrH34qGs7q_boNps'; // Converte o corpo da requisição em uma string JSON
    String requestBodyJson = jsonEncode(requestBody);
    print(token);

    print(requestBody);
    // URL do endpoint do backend
    String url = 'http://localhost:8100/friend/create/<user>';

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
      print('Ente adicionado');
      Navigator.of(context).pop();
    } else {
      // Houve um erro ao adicionar o remédio
      // Exiba uma mensagem de erro ou faça algo apropriado com base na resposta do servidor
      print('Falha ao adicionar o ente. Status code: ${response.statusCode}');
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
                Icons.person,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Nome',
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
            controller: _contato,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Contato',
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
            controller: _parentesco,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.groups_2,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Parentesco',
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
          decoration: kBoxDecorationStyleCadastro,
          width: 390.0,
          height: 200.0,
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
              hintText: '   Adicionar Descrição ...',
              hintStyle: kHintTextStyleCadastro,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePicker() {
    return Column(children: [
      Center(
        child: GestureDetector(
          child: const Text('Selecionar Imagem'),
          //onPressed: _openImagePicker,
          //onTap:()=> Get.find<ImageController>().pickImage(),
          onTap: () => _pickImage(),
        ),
      ),
      const SizedBox(height: 35),
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 70,
        color: Colors.grey[300],
        child: _pickedFile != null
            ? Image.file(
                File(_pickedFile!.path),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : const Text('Please select an image'),
      )
    ]);
  }

  Widget _buildLoginBtn() {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 250.0,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          String nome =
              _nome.text; // Obtenha o nome do remédio do campo de entrada
          String contato = _contato
              .text; // Obtenha a descrição do remédio do campo de entrada
          String parentesco = _parentesco.text;
          String descricao = _descricao.text;
          criarPessoa(nome, contato, parentesco, descricao);
        },
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
      appBar: AppBar(
        title: new Center(
            child: new Text("Adicionar Ente",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inknut Antiqua',
                ))),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70.0,
                    //vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //_buildImage(),
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
                      //SizedBox(height: 5.0),
                      //_buildImagePicker(),
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

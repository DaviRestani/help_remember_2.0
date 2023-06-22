// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:help_remember/utilities/constants.dart';

class AddAtividade extends StatefulWidget {
  const AddAtividade({Key? key}) : super(key: key);

  @override
  _AddAtividadeState createState() => _AddAtividadeState();
}

class _AddAtividadeState extends State<AddAtividade> {
  TimeOfDay _selectedTime = const TimeOfDay(hour: 12, minute: 30);
  ValueChanged<TimeOfDay>? selectTime;

  DateTime? _dateTime;

  bool enabled_dom = false;
  bool enabled_seg = false;
  bool enabled_ter = false;
  bool enabled_qua = false;
  bool enabled_qui = false;
  bool enabled_sex = false;
  bool enabled_sab = false;

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  void criarAtividade(String nome, String descricao) async {
    Map<String, dynamic> requestBody = {
      'nomeAtividade': nome,
      'descricaoAtividade': descricao,
    };

    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2ODczMDY0MzgsInVzZXJJRCI6Ik9iamVjdElkKFwiNjQ5MjNiMGJjZGY3ZTI0MmI5OTc4MTMwXCIpIn0.Y0BZuCCoJI-7iE-23Lub0VDOlyrwrH34qGs7q_boNps'; // Converte o corpo da requisição em uma string JSON
    String requestBodyJson = jsonEncode(requestBody);
    print(token);

    print(requestBody);
    // URL do endpoint do backend
    String url = 'http://localhost:8100/activity/create/<user>';

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
      print('Atividade adicionada');
      Navigator.of(context).pop();
    } else {
      // Houve um erro ao adicionar o remédio
      // Exiba uma mensagem de erro ou faça algo apropriado com base na resposta do servidor
      print(
          'Falha ao adicionar o atividade. Status code: ${response.statusCode}');
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
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.fitness_center_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              hintText: 'Nome da Atividade Física',
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
          height: 100.0,
          child: TextField(
            controller: _descricao,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Inknut Antiqua',
            ),
            decoration: InputDecoration(
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

  @override
  void initState() {
    _selectedTime = const TimeOfDay(hour: 12, minute: 30);

    super.initState();
  }

  List<String> diasDaSemana = ['DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff1b2c57),
      appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
              child: Column(
            children: const <Widget>[
              Text('Adicionar Atividade',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25.0))
            ],
          ))),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff1b2c57),
                Color(0xff1b2c57),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
              stops: [0.1, 0.5, 0.6, 0.9],
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 5.0,
              ),
              GestureDetector(
                child: Text(
                    _dateTime == null ? '2023-01-01' : _dateTime.toString(),
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2025))
                      .then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                  });
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              GestureDetector(
                child: Text(_selectedTime.format(context),
                    style: const TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onTap: () {
                  _selectTime(context);
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...diasDaSemana.map(
                      (e) => SizedBox(
                        width: 65.0,
                        height: 50.0,
                        //decoration: BoxDecoration(
                        //    color:
                        //        (enabled_seg) ? Colors.black : Colors.transparent,
                        //    borderRadius: BorderRadiusDirectional.circular(100.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () {
                              switch (e) {
                                case 'DOM':
                                  enabled_dom = !enabled_dom;
                                  break;
                                case 'SEG':
                                  enabled_seg = !enabled_seg;
                                  break;
                                case 'TER':
                                  enabled_ter = !enabled_ter;
                                  break;
                                case 'QUA':
                                  enabled_qua = !enabled_qua;
                                  break;
                                case 'QUI':
                                  enabled_qui = !enabled_qui;
                                  break;
                                case 'SEX':
                                  enabled_sex = !enabled_sex;
                                  break;
                                case 'SAB':
                                  enabled_sab = !enabled_sab;
                                  break;
                              }
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: (() {
                                if (e == 'DOM' && enabled_dom) {
                                  return Colors.white;
                                } else if (e == 'SEG' && enabled_seg) {
                                  return Colors.white;
                                } else if (e == 'TER' && enabled_ter) {
                                  return Colors.white;
                                } else if (e == 'QUA' && enabled_qua) {
                                  return Colors.white;
                                } else if (e == 'QUI' && enabled_qui) {
                                  return Colors.white;
                                } else if (e == 'SEX' && enabled_sex) {
                                  return Colors.white;
                                } else if (e == 'SAB' && enabled_sab) {
                                  return Colors.white;
                                } else {
                                  return const Color(0xff1b2c57);
                                }
                              })(),
                              foregroundColor: (() {
                                if (e == 'DOM' && enabled_dom) {
                                  return const Color(0xff1b2c57);
                                } else if (e == 'SEG' && enabled_seg) {
                                  return const Color(0xff1b2c57);
                                } else if (e == 'TER' && enabled_ter) {
                                  return const Color(0xff1b2c57);
                                } else if (e == 'QUA' && enabled_qua) {
                                  return const Color(0xff1b2c57);
                                } else if (e == 'QUI' && enabled_qui) {
                                  return const Color(0xff1b2c57);
                                } else if (e == 'SEX' && enabled_sex) {
                                  return const Color(0xff1b2c57);
                                } else if (e == 'SAB' && enabled_sab) {
                                  return const Color(0xff1b2c57);
                                } else {
                                  return Colors.white;
                                }
                              })(),
                            ),
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Container(
              //       width: 65.0,
              //       height: 50.0,
              //       decoration: BoxDecoration(
              //           color: (enabled_dom) ? Colors.red : Colors.red,
              //           borderRadius: BorderRadiusDirectional.circular(100.0)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: ElevatedButton(
              //           onPressed: () =>
              //               setState(() => enabled_dom = !enabled_dom),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: enabled_dom
              //                 ? Colors.white
              //                 : const Color(
              //                     0xff1b2c57), // This is what you need!
              //           ),
              //           child: const Text(
              //             'Dom',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 12.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 65.0,
              //       height: 50.0,
              //       //decoration: BoxDecoration(
              //       //    color:
              //       //        (enabled_seg) ? Colors.black : Colors.transparent,
              //       //    borderRadius: BorderRadiusDirectional.circular(100.0)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: ElevatedButton(
              //           onPressed: () =>
              //               setState(() => enabled_seg = !enabled_seg),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: enabled_seg
              //                 ? Colors.white
              //                 : const Color(0xff1b2c57),
              //             foregroundColor: enabled_seg
              //                 ? const Color(0xff1b2c57)
              //                 : Colors
              //                     .white, // This is what you need! // This is what you need!
              //           ),
              //           child: const Text(
              //             'Seg',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 12.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 65.0,
              //       height: 50.0,
              //       //decoration: BoxDecoration(
              //       //    color:
              //       //        (enabled_ter) ? Colors.black : Colors.transparent,
              //       //    borderRadius: BorderRadiusDirectional.circular(100.0)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: ElevatedButton(
              //           onPressed: () =>
              //               setState(() => enabled_ter = !enabled_ter),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: enabled_ter
              //                 ? Colors.white
              //                 : const Color(0xff1b2c57),
              //             foregroundColor: enabled_ter
              //                 ? const Color(0xff1b2c57)
              //                 : Colors
              //                     .white, // This is what you need! // This is what you need!
              //           ),
              //           child: const Text(
              //             'Ter',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 12.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 65.0,
              //       height: 50.0,
              //       //decoration: BoxDecoration(
              //       //    color:
              //       //        (enabled_qua) ? Colors.black : Colors.transparent,
              //       //    borderRadius: BorderRadiusDirectional.circular(100.0)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: ElevatedButton(
              //           onPressed: () =>
              //               setState(() => enabled_qua = !enabled_qua),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: enabled_qua
              //                 ? Colors.white
              //                 : const Color(0xff1b2c57),
              //             foregroundColor: enabled_qua
              //                 ? const Color(0xff1b2c57)
              //                 : Colors
              //                     .white, // This is what you need! // This is what you need!
              //           ),
              //           child: const Text(
              //             'Qua',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 12.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 65.0,
              //       height: 50.0,
              //       //decoration: BoxDecoration(
              //       //    color:
              //       //        (enabled_qui) ? Colors.black : Colors.transparent,
              //       //    borderRadius: BorderRadiusDirectional.circular(100.0)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: ElevatedButton(
              //           onPressed: () =>
              //               setState(() => enabled_qui = !enabled_qui),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: enabled_qui
              //                 ? Colors.white
              //                 : const Color(0xff1b2c57),
              //             foregroundColor: enabled_qui
              //                 ? const Color(0xff1b2c57)
              //                 : Colors
              //                     .white, // This is what you need! // This is what you need!
              //           ),
              //           child: const Text(
              //             'Qui',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 12.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 65.0,
              //       height: 50.0,
              //       //decoration: BoxDecoration(
              //       //    color:
              //       //        (enabled_sex) ? Colors.black : Colors.transparent,
              //       //    borderRadius: BorderRadiusDirectional.circular(100.0)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: ElevatedButton(
              //           onPressed: () =>
              //               setState(() => enabled_sex = !enabled_sex),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: enabled_sex
              //                 ? Colors.white
              //                 : const Color(0xff1b2c57),
              //             foregroundColor: enabled_sex
              //                 ? const Color(0xff1b2c57)
              //                 : Colors
              //                     .white, // This is what you need! // This is what you need!
              //           ),
              //           child: const Text(
              //             'Sex',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 12.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 65.0,
              //       height: 50.0,
              //       //decoration: BoxDecoration(
              //       //    color:
              //       //        (enabled_sab) ? Colors.black : Colors.transparent,
              //       //    borderRadius: BorderRadiusDirectional.circular(100.0)),
              //       child: Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: ElevatedButton(
              //           onPressed: () =>
              //               setState(() => enabled_sab = !enabled_sab),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: enabled_sab
              //                 ? Colors.white
              //                 : const Color(0xff1b2c57),
              //             foregroundColor: enabled_sab
              //                 ? const Color(0xff1b2c57)
              //                 : Colors.white, // This is what you need!
              //           ),
              //           child: const Text(
              //             'Sab',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 12.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     //circleDay('Dom', context, true),
              //     //circleDay('Seg', context, false),
              //     //circleDay('Ter', context, false),
              //     //circleDay('Qua', context, false),
              //     //circleDay('Qui', context, false),
              //     //circleDay('Sex', context, true),
              //     //circleDay('Sab', context, false),
              //   ],
              // ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 2.0,
                child: Container(
                  color: Colors.white30,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                title: Text(
                  "Notificação de Alarme",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 2.0,
                child: Container(
                  color: Colors.white30,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.check_box,
                  color: Colors.white,
                ),
                title: Text("Vibração",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 2.0,
                child: Container(
                  color: Colors.white30,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              _buildNameTF(),
              const SizedBox(
                height: 5.0,
              ),
              _buildPasswordTF(),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    String nome = _nome.text;
                    String descricao = _descricao.text;
                    criarAtividade(nome, descricao);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
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
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);

    setState(() {
      _selectedTime = picked!;
    });
  }
}

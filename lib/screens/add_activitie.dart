// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

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
          child: const TextField(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 65.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color:
                            (enabled_dom) ? Colors.black : Colors.transparent,
                        borderRadius: BorderRadiusDirectional.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            setState(() => enabled_dom = !enabled_dom),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: enabled_dom
                              ? Colors.white
                              : const Color(0xff1b2c57), // This is what you need!
                        ),
                        child: const Text(
                          'Dom',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65.0,
                    height: 50.0,
                    //decoration: BoxDecoration(
                    //    color:
                    //        (enabled_seg) ? Colors.black : Colors.transparent,
                    //    borderRadius: BorderRadiusDirectional.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            setState(() => enabled_seg = !enabled_seg),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              enabled_seg ? Colors.white : const Color(0xff1b2c57),
                          foregroundColor: enabled_seg
                              ? const Color(0xff1b2c57)
                              : Colors
                                  .white, // This is what you need! // This is what you need!
                        ),
                        child: const Text(
                          'Seg',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65.0,
                    height: 50.0,
                    //decoration: BoxDecoration(
                    //    color:
                    //        (enabled_ter) ? Colors.black : Colors.transparent,
                    //    borderRadius: BorderRadiusDirectional.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            setState(() => enabled_ter = !enabled_ter),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              enabled_ter ? Colors.white : const Color(0xff1b2c57),
                          foregroundColor: enabled_ter
                              ? const Color(0xff1b2c57)
                              : Colors
                                  .white, // This is what you need! // This is what you need!
                        ),
                        child: const Text(
                          'Ter',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65.0,
                    height: 50.0,
                    //decoration: BoxDecoration(
                    //    color:
                    //        (enabled_qua) ? Colors.black : Colors.transparent,
                    //    borderRadius: BorderRadiusDirectional.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            setState(() => enabled_qua = !enabled_qua),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              enabled_qua ? Colors.white : const Color(0xff1b2c57),
                          foregroundColor: enabled_qua
                              ? const Color(0xff1b2c57)
                              : Colors
                                  .white, // This is what you need! // This is what you need!
                        ),
                        child: const Text(
                          'Qua',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65.0,
                    height: 50.0,
                    //decoration: BoxDecoration(
                    //    color:
                    //        (enabled_qui) ? Colors.black : Colors.transparent,
                    //    borderRadius: BorderRadiusDirectional.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            setState(() => enabled_qui = !enabled_qui),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              enabled_qui ? Colors.white : const Color(0xff1b2c57),
                          foregroundColor: enabled_qui
                              ? const Color(0xff1b2c57)
                              : Colors
                                  .white, // This is what you need! // This is what you need!
                        ),
                        child: const Text(
                          'Qui',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65.0,
                    height: 50.0,
                    //decoration: BoxDecoration(
                    //    color:
                    //        (enabled_sex) ? Colors.black : Colors.transparent,
                    //    borderRadius: BorderRadiusDirectional.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            setState(() => enabled_sex = !enabled_sex),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              enabled_sex ? Colors.white : const Color(0xff1b2c57),
                          foregroundColor: enabled_sex
                              ? const Color(0xff1b2c57)
                              : Colors
                                  .white, // This is what you need! // This is what you need!
                        ),
                        child: const Text(
                          'Sex',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65.0,
                    height: 50.0,
                    //decoration: BoxDecoration(
                    //    color:
                    //        (enabled_sab) ? Colors.black : Colors.transparent,
                    //    borderRadius: BorderRadiusDirectional.circular(100.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            setState(() => enabled_sab = !enabled_sab),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              enabled_sab ? Colors.white : const Color(0xff1b2c57),
                          foregroundColor: enabled_sab
                              ? const Color(0xff1b2c57)
                              : Colors.white, // This is what you need!
                        ),
                        child: const Text(
                          'Sab',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                  //circleDay('Dom', context, true),
                  //circleDay('Seg', context, false),
                  //circleDay('Ter', context, false),
                  //circleDay('Qua', context, false),
                  //circleDay('Qui', context, false),
                  //circleDay('Sex', context, true),
                  //circleDay('Sab', context, false),
                ],
              ),
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
                  onPressed: () => Navigator.of(context).pop(),
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

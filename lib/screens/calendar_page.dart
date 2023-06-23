import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  DateTime? selectedDay;
  List<CleanCalendarEvent>? selectedEvent;
  final Map<DateTime, List<CleanCalendarEvent>>? events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent(
        'Treino básico',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        description: 'Atividade Física',
        color: Colors.green,
      )
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent(
        'Paracetamol',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        description: 'Remédio',
        color: Colors.red,
      ),
      CleanCalendarEvent(
        'Dieta I',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        description: 'Alimentação',
        color: Colors.purple,
      )
    ],
  };

  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events![selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState() {
    selectedEvent = events![selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Calendário'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        child: Calendar(
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range) {
            print('Selecionar dia ${range.from},${range.to}');
          },
          onDateSelected: (date) {
            return _handleData(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black12,
            fontWeight: FontWeight.w100,
          ),
          bottomBarTextStyle: const TextStyle(
            color: Colors.black12,
          ),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 20,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}

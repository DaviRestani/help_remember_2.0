import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDummyDiary = [
  {
    "albumId": 1,
    "id": 1,
    "title": "18 Março",
    "thumbnailUrl": "assets/icons/esportes.png",
    "tipo": "Março",
    "resumo": "Trabalho",
    "data": "2023",
    "texto":
        "A origem da palavra Filosofia é atribuída a Pitágoras, um filósofo grego, fundador da escola filosófica pitagórica, uma importante corrente da Filosofia, fortemente ligada aos números e suas relações de harmonia."
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "19 Março",
    "thumbnailUrl": "assets/icons/atividade-fisica.png",
    "tipo": "Março",
    "resumo": "Promoção",
    "data": "2023",
    "texto":
        "A origem da palavra Filosofia é atribuída a Pitágoras, um filósofo grego, fundador da escola filosófica pitagórica, uma importante corrente da Filosofia, fortemente ligada aos números e suas relações de harmonia."
  },
];

class GroupListDiary extends StatefulWidget {
  @override
  State<GroupListDiary> createState() => _GroupListDiaryState();
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Pesquisar',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Calendário',
              icon: const Icon(Icons.calendar_month),
              onPressed: () {
                Navigator.of(context).pushNamed('/calendar_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupListDiaryState extends State<GroupListDiary> {
  final bool _showFab = true;
  final bool _showNotch = true;
  final FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Menu Principal'),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Família'),
              onTap: () {
                Navigator.of(context).pushNamed('/family_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.medication),
              title: const Text('Remédios'),
              onTap: () {
                Navigator.of(context).pushNamed('/medicine_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_baseball),
              title: const Text('Atividade Fisíca'),
              onTap: () {
                Navigator.of(context).pushNamed('/physical_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text('Diário'),
              onTap: () {
                Navigator.of(context).pushNamed('/diary_page');
              },
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text('Alimentação'),
              onTap: () {
                Navigator.of(context).pushNamed('/food_list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.games),
              title: const Text('Jogos'),
              onTap: () {
                Navigator.of(context).pushNamed('/games_page');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Center(
            child: Text("Diário",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inknut Antiqua',
                ))),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _dataDummyDiary, //Banco de Dados --------------------------
        groupBy: (element) => element['tipo'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                  child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      groupByValue,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inknut Antiqua',
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        itemBuilder: (context, dynamic element) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 207, 229, 255),
                    Color.fromARGB(255, 101, 165, 243),
                    Color.fromARGB(255, 18, 93, 178),
                  ],
                  stops: [0.1, 0.7, 0.8, 0.9],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                element['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontFamily: 'Inknut Antiqua',
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_today,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${element['data']}',
                                      style: TextStyle(
                                          fontFamily: 'Inknut Antiqua',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.bookmark,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${element['resumo']}',
                                      style: TextStyle(
                                          fontFamily: 'Inknut Antiqua',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                element['texto'],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 11,
                                    fontFamily: 'Inknut Antiqua'),
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 50, right: 1),
                              child: ElevatedButton(
                                onPressed: () => print('Botão Logar'),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.delete,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        size: 25),
                                  ],
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 213, 38, 38),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 50, right: 1, top: 5),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/edit_diary');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.create,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        size: 25),
                                  ],
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 202, 39, 158),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_diary');
              },
              tooltip: 'Criar',
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _DemoBottomAppBar(
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),
    );
  }
}

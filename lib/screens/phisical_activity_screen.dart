// ignore_for_file: unnecessary_new, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDummy = [
  {
    "albumId": 1,
    "id": 1,
    "title": "Treino básico",
    "thumbnailUrl": "assets/icons/esportes.png",
    "tipo": "Atividades",
    "data": "22/06/23",
    "group": "d"
  },
];

class GroupListPhysical extends StatefulWidget {
  @override
  State<GroupListPhysical> createState() => _GroupListPhysicalState();
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

class _GroupListPhysicalState extends State<GroupListPhysical> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
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
            child: Text("Atividades Físicas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inknut Antiqua',
                ))),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _dataDummy, //Banco de Dados --------------------------
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
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color.fromARGB(255, 18, 93, 178),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ClipRRect(
                          child: Container(
                              child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        //padding: EdgeInsets.only(top: 20),
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image(
                          //width: 140.0,
                          image: new AssetImage(element['thumbnailUrl']),
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  )))),
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                element['title'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Inknut Antiqua',
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.calendar_today,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 16),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text('${element['data']}'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/edit_phisical');
                      },
                      child: const Icon(
                        Icons.create,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
                Navigator.of(context).pushNamed('/add_activitie');
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

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDummy = [
  {
    "albumId": 1,
    "id": 1,
    "title": "Treino básico",
    "thumbnailUrl": "icons/esportes.png",
    "tipo": "Tipo A",
    "data": "08/04/23",
    "group": "d"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Aerôbica",
    "thumbnailUrl": "icons/atividade-fisica.png",
    "tipo": "Tipo B",
    "data": "09/04/23",
    "group": "a"
  },
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GroupList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GroupList extends StatefulWidget {
  @override
  State<GroupList> createState() => _GroupListState();
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
            IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Pesquisar',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Calendário',
              icon: const Icon(Icons.calendar_month),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupListState extends State<GroupList> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: new Text("Atividades Físicas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inknut Antiqua',
                ))),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _dataDummy, //Banco de Dados --------------------------
        groupBy: (element) => element['tipo'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      groupByValue,
                      textAlign: TextAlign.start,
                      style: TextStyle(
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
                                    fontSize: 18,
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
                                    child: Text('${element['data']}'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      child: Container(
                    width: 40.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => print('Botão Logar'),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.delete,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 25),
                        ],
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 213, 38, 38),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    width: 40.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => print('Botão Logar'),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.create,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 25),
                        ],
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 202, 39, 158),
                        ),
                      ),
                    ),
                  ))
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
              onPressed: () {},
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

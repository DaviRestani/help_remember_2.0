import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDummy = [
  {
    "albumId": 1,
    "id": 3,
    "title": "Gabriel Cardoso",
    "thumbnailUrl": "icons/Harry.png",
    "parente": "Amigo",
    "data": "10/04/23",
    "group": "g"
  },
];

class User {
  final String imagePath;
  final String name;
  final String contato;
  final String parente;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.contato,
    required this.parente,
    required this.about,
  });
}

class UserPreferences {
  static const myUser = User(
    imagePath: 'assets/icons/diario.png',
    name: "22 de Junho",
    contato: "(35)929793197",
    parente: "Amigo",
    about: "Hoje fiz uma caminhada no parque e vi umas capivaras"
  );
}

//Perfil -------------------------------------------------------------
class ProfileWidgetDiary extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidgetDiary({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEdition(color),
          )
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return Material(
      child: GestureDetector(
        onTap: onClicked,
        child: Container(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 65,
            backgroundImage: AssetImage(imagePath),
            child: const CircleAvatar(
              radius: 65,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEdition(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

//----- -------------------------------------------------------------

class EditPhisicalPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
      ),
      home: GroupListEditDiary(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GroupListEditDiary extends StatefulWidget {
  @override
  State<GroupListEditDiary> createState() => _GroupListEditDiaryState();
}

class _GroupListEditDiaryState extends State<GroupListEditDiary> {
  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      );

  Widget buildDivider() => Container(
        margin: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: const Divider(
          color: Colors.blue,
          height: 24,
        ),
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Informações",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        //backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidgetDiary(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 20),
          buildName(user),
          const SizedBox(height: 20),
          buildDivider(),
          const SizedBox(height: 20),
          buildAbout(user),
        ],
      ),
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

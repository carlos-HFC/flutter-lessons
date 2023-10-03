import 'package:flutter/material.dart';
import 'Pessoal.dart';
import 'Formacao.dart';
import 'Experiencia.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _currentPage = 0;

  final screens = [
    const Center(child: Text("Tela Home")),
    const Pessoal(),
    const Formacao(),
    const Experiencia(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Meu Perfil"),
          centerTitle: true,
        ),
        body: screens[_currentPage],
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Carlos Faustino"),
                accountEmail: Text("chfcchfc96@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://github.com/carlos-hfc.png",
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.house,
                  size: 32,
                ),
                onTap: () {
                  setState(() {
                    _currentPage = 0;
                    _scaffoldKey.currentState?.closeDrawer();
                  });
                },
              ),
              ListTile(
                title: Text(
                  "Pessoal",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.person,
                  size: 32,
                ),
                onTap: () {
                  setState(() {
                    _currentPage = 1;
                    _scaffoldKey.currentState?.closeDrawer();
                  });
                },
              ),
              ListTile(
                title: Text(
                  "Formação",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.school,
                  size: 32,
                ),
                onTap: () {
                  setState(() {
                    _currentPage = 2;
                    _scaffoldKey.currentState?.closeDrawer();
                  });
                },
              ),
              ListTile(
                title: Text(
                  "Experiência",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.class_,
                  size: 32,
                ),
                onTap: () {
                  setState(() {
                    _currentPage = 3;
                    _scaffoldKey.currentState?.closeDrawer();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

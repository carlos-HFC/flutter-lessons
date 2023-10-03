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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Pessoal",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Formação",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.class_),
              label: "Experiência",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}

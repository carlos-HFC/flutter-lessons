import 'package:flutter/material.dart';

void main() => runApp(const Ex1());

class Ex1 extends StatelessWidget {
  const Ex1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: _container(),
      ),
    );
  }

  _container() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          SizedBox(height: 32),
          Image.network(
            "https://github.com/carlos-hfc.png",
            height: 200,
          ),
          SizedBox(height: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _info([
                _titleField("Dados pessoais"),
                _textField("Carlos Henrique Faustino Cardoso"),
              ]),
              _info([
                _titleField("Formação"),
                _textField("FIAP"),
              ]),
              _info([
                _titleField("Experiência"),
                _textField("Compass - 2 anos"),
              ]),
              _info([
                _titleField("Projetos"),
                _textField("https://github.com/carlos-hfc"),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  _title() {
    return Text(
      "Meu Perfil",
      style: TextStyle(
        fontSize: 30,
        color: Colors.green,
      ),
    );
  }

  _info(List<Widget> child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...child,
        SizedBox(height: 16),
      ],
    );
  }

  _titleField(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        color: Colors.green,
      ),
    );
  }

  _textField(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Colors.green,
      ),
    );
  }
}

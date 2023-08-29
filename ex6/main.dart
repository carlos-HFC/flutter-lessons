import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const Ex6());

class Ex6 extends StatelessWidget {
  const Ex6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int value = 0;

  String strResult = "?";

  void _showResult() {
    setState(() {
      value = Random().nextInt(10);

      strResult = value.toString().padLeft(2, '0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _title(),
          SizedBox(height: 32),
          Image.network(
            "https://picsum.photos/400/250?random=${value + 1}",
            height: 150,
          ),
          SizedBox(height: 32),
          _text(),
          SizedBox(height: 24),
          _result(),
          SizedBox(height: 32),
          _button(),
        ],
      ),
    );
  }

  _title() {
    return Center(
      child: Text(
        "Jogo do número aleatório",
        style: TextStyle(
          fontSize: 32,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _text() {
    return Center(
        child: Text(
      "Pense em um número de 0 a 10",
      style: TextStyle(
        fontSize: 32,
        color: Colors.red,
      ),
      textAlign: TextAlign.center,
    ));
  }

  _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: Size(150, 50),
      ),
      onPressed: _showResult,
      child: Text(
        "Descobrir",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _result() {
    return Center(
      child: Text(
        strResult,
        style: TextStyle(
          color: Colors.red,
          fontSize: 32,
        ),
      ),
    );
  }
}

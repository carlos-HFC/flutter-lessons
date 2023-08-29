import 'package:flutter/material.dart';

void main() => runApp(const Ex2());

class Ex2 extends StatelessWidget {
  const Ex2({Key? key}) : super(key: key);

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
  int _value = 0;

  void _update(String title) {
    setState(() {
      if (title.trim() == "+") {
        _value++;
      } else {
        if (_value == 0) return;
        _value--;
      }
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
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _title(),
          _texto(),
          _containerButton(),
        ],
      ),
    );
  }

  _title() {
    return Text(
      "Contador de pessoas",
      style: TextStyle(
        fontSize: 30,
        color: Colors.orange,
      ),
    );
  }

  _containerButton() {
    return Container(
      width: double.infinity,
      height: 150,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _button("+", Colors.green),
          _button("-", Colors.red),
        ],
      ),
    );
  }

  _texto() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      height: 120,
      width: 120,
      child: Text(
        _value.toString(),
        style: TextStyle(
          fontSize: 80,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _button(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(150, 50),
      ),
      onPressed: () => _update(text),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}

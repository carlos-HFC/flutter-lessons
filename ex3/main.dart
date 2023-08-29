import 'package:flutter/material.dart';

void main() => runApp(const Ex3());

class Ex3 extends StatelessWidget {
  const Ex3({Key? key}) : super(key: key);

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
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  String strResult = "Resultado: ";
  double res = 0;

  void _showResult() {
    setState(() {
      double firstNumber = double.parse(firstNumberController.text);
      double secondNumber = double.parse(firstNumberController.text);

      res = firstNumber * secondNumber;

      strResult = "Resultado: $res";
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
          SizedBox(height: 36),
          _field("Digite o primeiro número", firstNumberController),
          SizedBox(height: 16),
          _field("Digite o segundo número", secondNumberController),
          SizedBox(height: 24),
          _button(),
          SizedBox(height: 32),
          _result(),
        ],
      ),
    );
  }

  _title() {
    return Center(
      child: Text(
        "Multiplicador de números",
        style: TextStyle(
          fontSize: 32,
          color: Colors.orange,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _field(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: Size(150, 50),
      ),
      onPressed: _showResult,
      child: Text(
        "Calcular",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  _result() {
    return Center(
      child: Text(
        strResult,
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const Ex4());

class Ex4 extends StatelessWidget {
  const Ex4({Key? key}) : super(key: key);

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
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  String strResult = "";
  double res = 0;

  void _showResult() {
    setState(() {
      double alcool = double.parse(alcoolController.text);
      double gasolina = double.parse(alcoolController.text);

      res = alcool / gasolina;

      strResult = res < 0.7 ? "Álcool é melhor" : "Gasolina é melhor";
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
          Image.network(
              "https://images.unsplash.com/photo-1625056845185-9f60e8d15189?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
          SizedBox(height: 36),
          _field("Digite o preço do álcool", alcoolController),
          SizedBox(height: 16),
          _field("Digite o preço da gasolina", gasolinaController),
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
        "Álcool ou Gasolina",
        style: TextStyle(
          fontSize: 32,
          color: Colors.black,
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
        backgroundColor: Colors.green,
        fixedSize: Size(150, 50),
      ),
      onPressed: _showResult,
      child: Text(
        "Verificar",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
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
          fontSize: 18,
        ),
      ),
    );
  }
}

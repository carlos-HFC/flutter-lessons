import 'package:flutter/material.dart';

void main() => runApp(const Ex5());

class Ex5 extends StatelessWidget {
  const Ex5({Key? key}) : super(key: key);

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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String strResult = "";

  void _showResult() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura =
          double.parse(alturaController.text.replaceAll('.', '')) / 100;

      double imc = peso / (altura * altura);

      if (imc < 18.5) {
        strResult = "Abaixo do peso";
      } else if (imc >= 18.5 && imc <= 24.9) {
        strResult = "Peso normal";
      } else if (imc >= 25 && imc <= 29.9) {
        strResult = "Sobrepeso";
      } else if (imc >= 30 && imc <= 34.9) {
        strResult = "Obesidade Grau I";
      } else if (imc >= 35 && imc <= 39.9) {
        strResult = "Obesidade Grau II";
      } else {
        strResult = "Obesidade Grau III ou Mórbida";
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
              "https://www.saudebemestar.pt/media/89347/obesidade.jpg"),
          SizedBox(height: 36),
          _field("Digite o peso", pesoController),
          SizedBox(height: 16),
          _field("Digite a altura (em cm)", alturaController),
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
        "Cálculo do IMC",
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

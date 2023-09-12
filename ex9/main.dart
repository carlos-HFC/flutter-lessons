import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  TextEditingController valueController = TextEditingController();

  String dropdownDe = "real";
  String dropdownPara = "real";
  String strResult = "";

  void _onChanged(String name, String value) {
    setState(() {
      if (name == 'de') dropdownDe = value;
      if (name == 'para') dropdownPara = value;
    });
  }

  void _showResult() {
    setState(() {
      double value = double.parse(valueController.text);

      switch (dropdownDe) {
        case 'real':
          if (dropdownPara == 'dolar') {
            strResult = (value / 4.93).toStringAsFixed(2);
          } else if (dropdownPara == 'euro') {
            strResult = (value / 5.3).toStringAsFixed(2);
          } else {
            strResult = value.toStringAsFixed(2);
          }
          break;
        case 'dolar':
          if (dropdownPara == 'real') {
            strResult = (value * 4.93).toStringAsFixed(2);
          } else if (dropdownPara == 'euro') {
            strResult = (value / 1.08).toStringAsFixed(2);
          } else {
            strResult = value.toStringAsFixed(2);
          }
          break;
        case 'euro':
          if (dropdownPara == 'real') {
            strResult = (value * 5.3).toStringAsFixed(2);
          } else if (dropdownPara == 'dolar') {
            strResult = (value * 1.08).toStringAsFixed(2);
          } else {
            strResult = value.toStringAsFixed(2);
          }
          break;
        default:
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
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _title(),
            SizedBox(height: 16),
            _field(),
            SizedBox(height: 16),
            _dropdown("De", dropdownDe),
            SizedBox(height: 16),
            _dropdown("Para", dropdownPara),
            SizedBox(height: 16),
            _button(),
            SizedBox(height: 16),
            _result()
          ],
        ),
      ],
    );
  }

  _title() {
    return Center(
      child: Text(
        "Conversor de Moedas",
        style: TextStyle(
          fontSize: 32,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _field() {
    return TextField(
      controller: valueController,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 24,
      ),
      decoration: InputDecoration(
        labelText: "Valor",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    );
  }

  _dropdown(String label, String controller) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(width: 16),
        DropdownButton<String>(
          value: controller,
          items: <String>['Dolar', 'Euro', 'Real'].map((String value) {
            return DropdownMenuItem<String>(
              value: value.toLowerCase(),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? selected) {
            _onChanged(label.toLowerCase(), selected!);
          },
        ),
      ],
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
        "Converter",
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
          color: Colors.green,
          fontSize: 24,
        ),
      ),
    );
  }
}

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
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String sexController = "M";
  String schoolController = "Ensino Fundamental";
  double limitController = 0;
  bool nationalityController = true;
  bool showResult = false;

  String name = "";
  String age = "";

  void _onChangedDropdown(String name, String value) {
    setState(() {
      if (name.toLowerCase() == 'sexo') {
        sexController = value;
      } else {
        schoolController = value;
      }
    });
  }

  void _showResult() {
    setState(() {
      name = nameController.text;
      age = ageController.text;
      showResult = true;
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
            SizedBox(height: 8),
            _field(
              "Nome",
              nameController,
            ),
            SizedBox(height: 8),
            _field(
              "Idade",
              ageController,
            ),
            SizedBox(height: 8),
            _dropdown(
              "Sexo",
              ["M", "F", "O"],
              sexController,
            ),
            SizedBox(height: 8),
            _dropdown(
              "Escolaridade",
              [
                "Ensino Fundamental",
                "Ensino Médio",
                "Ensino Superior",
                "Pós-Graduação",
                "Mestrado",
                "Doutorado"
              ],
              schoolController,
            ),
            SizedBox(height: 8),
            _slider(
              "Limite",
            ),
            SizedBox(height: 8),
            _switch(
              "Brasileiro",
            ),
            SizedBox(height: 8),
            _button(),
            SizedBox(height: 24),
            showResult ? _result() : SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  _title() {
    return Center(
      child: Text(
        "Abertura de Conta",
        style: TextStyle(
          fontSize: 32,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _field(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 24,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    );
  }

  _dropdown(String label, List<String> items, String controller) {
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
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? selected) {
            _onChangedDropdown(label, selected!);
          },
        ),
      ],
    );
  }

  _slider(String label) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(width: 16),
        Slider(
          min: 0,
          max: 5000,
          divisions: 100,
          label: limitController.toString(),
          value: limitController,
          onChanged: (double value) {
            setState(() {
              limitController = value;
            });
          },
        ),
      ],
    );
  }

  _switch(String label) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(width: 16),
        Switch(
          value: nationalityController,
          onChanged: (value) {
            setState(() {
              nationalityController = value;
            });
          },
        ),
      ],
    );
  }

  _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: Size(
          200,
          50,
        ),
      ),
      onPressed: _showResult,
      child: Text(
        "Confirmar",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _result() {
    return Column(
      children: [
        Text(
          "Dados informados",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 16),
        _lines("Nome", name),
        SizedBox(height: 8),
        _lines("Idade", age),
        SizedBox(height: 8),
        _lines("Sexo", sexController),
        SizedBox(height: 8),
        _lines("Escolaridade", schoolController),
        SizedBox(height: 8),
        _lines("Limite", "R\$ $limitController"),
        SizedBox(height: 8),
        _lines("Brasileiro", nationalityController ? "Sim" : "Não"),
      ],
    );
  }

  _lines(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 16),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

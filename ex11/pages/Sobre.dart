import 'package:flutter/material.dart';
import 'Home.dart';

class Sobre extends StatelessWidget {
  String name;
  String age;
  String sex;
  String school;
  double limit;
  bool nationality;

  Sobre({
    required this.name,
    required this.age,
    required this.sex,
    required this.school,
    required this.limit,
    required this.nationality,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados Informados"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Column(
          children: [
            SizedBox(height: 16),
            _lines("Nome", name),
            SizedBox(height: 8),
            _lines("Idade", age),
            SizedBox(height: 8),
            _lines("Sexo", sex),
            SizedBox(height: 8),
            _lines("Escolaridade", school),
            SizedBox(height: 8),
            _lines("Limite", "R\$ $limit"),
            SizedBox(height: 8),
            _lines("Brasileiro", nationality ? "Sim" : "Não"),
          ],
        ),
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
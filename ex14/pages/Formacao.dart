import 'package:flutter/material.dart';

class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container(),
    );
  }

  _container() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://github.com/carlos-hfc.png",
              height: 200,
            ),
            SizedBox(height: 32),
            Column(
              children: [
                _lines("Ensino Superior", "FIAP"),
                SizedBox(height: 16),
                _lines("Ensino Médio", "E.E. Dr. Octávio Mendes"),
                SizedBox(height: 16),
                _lines("Ensino Fundamental", "Colégio Objetivo"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _lines(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
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

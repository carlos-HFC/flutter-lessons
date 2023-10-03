import 'package:flutter/material.dart';

class Pessoal extends StatelessWidget {
  const Pessoal({Key? key}) : super(key: key);

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
                _lines("Nome", "Carlos Henrique Faustino Cardoso"),
                SizedBox(height: 16),
                _lines("Idade", "26 anos"),
                SizedBox(height: 16),
                _lines("Altura", "1.77"),
                SizedBox(height: 16),
                _lines("Peso", "66 kg"),
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

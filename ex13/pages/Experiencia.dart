import 'package:flutter/material.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

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
                _lines("Compass.UOL", "2020 - "),
                SizedBox(height: 16),
                _lines("BCR", "2019 - 2020"),
                SizedBox(height: 16),
                _lines("McDonald's", "2014 - 2019"),
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

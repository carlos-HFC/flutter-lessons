import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            SizedBox(height: 32),
            _item('Desenvolvedor Backend'),
            SizedBox(height: 32),
            _item('Engenheiro de dados'),
            SizedBox(height: 32),
            _item('Desenvolvedor Frontend'),
            SizedBox(height: 32),
            _item('DBA'),
          ],
        ),
      ],
    );
  }

  _title() {
    return Center(
      child: Text(
        "Vagas",
        style: TextStyle(
          fontSize: 32,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _item(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),
          _paragraph(
            'Salário',
            '3000',
          ),
          SizedBox(height: 16),
          _paragraph(
            'Descrição',
            'Contrary to popular belief',
          ),
          SizedBox(height: 16),
          _paragraph(
            'Contato',
            '(11) 12345678',
          ),
        ],
      ),
    );
  }

  _paragraph(String title, String description) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

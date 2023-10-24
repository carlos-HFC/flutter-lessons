import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  TextEditingController cepController = TextEditingController();
  String cep = "";
  String address = "";
  String district = "";
  String city = "";
  String uf = "";
  bool result = false;

  _getCep() async {
    String url = 'https://viacep.com.br/ws/${cepController.text}/json';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> res = json.decode(response.body);

    setState(() {
      address = res['logradouro'];
      district = res['bairro'];
      city = res['localidade'];
      uf = res['uf'];
      cep = res['cep'];
      result = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("CEP x Endereço"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Digite o CEP",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    controller: cepController,
                  ),
                ),
                IconButton(
                  onPressed: _getCep,
                  icon: Icon(Icons.check),
                ),
              ],
            ),
            SizedBox(height: 20),
            result ? _result() : SizedBox(),
          ],
        ),
      ],
    );
  }

  _result() {
    return Column(
      children: [
        _lines('CEP:', cep),
        SizedBox(height: 20),
        _lines('Logradouro:', address),
        SizedBox(height: 20),
        _lines('Bairro:', district),
        SizedBox(height: 20),
        _lines('Cidade:', city),
        SizedBox(height: 20),
        _lines('Estado:', uf),
        SizedBox(height: 20),
      ],
    );
  }

  _lines(String label, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

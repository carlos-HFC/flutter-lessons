import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  TextEditingController userController = TextEditingController();
  int id = 0;
  String name = "";
  String created = "";
  int repositories = 0;
  int followers = 0;
  int following = 0;
  String image = "";
  bool result = false;

  _getCep() async {
    String url = 'https://api.github.com/users/${userController.text}';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> res = json.decode(response.body);

    setState(() {
      id = res['id'];
      name = res['name'];
      created = res['created_at'];
      repositories = res['public_repos'];
      followers = res['followers'];
      following = res['following'];
      image = res['avatar_url'];
      result = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perfil dos Devs"),
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
                      labelText: "Digite o username",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    controller: userController,
                  ),
                ),
                IconButton(
                  onPressed: _getCep,
                  icon: Icon(Icons.check),
                ),
              ],
            ),
            SizedBox(height: 20),
            image.isNotEmpty
                ? Image.network(
                    image,
                    width: 250,
                    fit: BoxFit.cover,
                  )
                : SizedBox(),
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
        _lines('ID:', id.toString()),
        SizedBox(height: 12),
        _lines('Nome:', name),
        SizedBox(height: 12),
        _lines('Repositórios:', repositories.toString()),
        SizedBox(height: 12),
        _lines('Criado em:', created),
        SizedBox(height: 12),
        _lines('Seguidores:', followers.toString()),
        SizedBox(height: 12),
        _lines('Seguindo:', following.toString()),
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
        SizedBox(width: 8),
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

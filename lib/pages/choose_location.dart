import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    Map data = jsonDecode(response.body);

    print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Escolha um local'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        child: Text('O contador é $counter'),
      ),
    );
  }
}

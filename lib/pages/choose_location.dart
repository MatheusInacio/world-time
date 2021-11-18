import 'package:flutter/material.dart';
import 'package:world_clock/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Jacarezinho', flag: 'Brazil.png', url: 'America/Sao_Paulo');
    await instance.getTime();
    //print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
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

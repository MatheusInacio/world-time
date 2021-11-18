import 'package:flutter/material.dart';
import 'package:world_clock/services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Jacarezinho', flag: 'Brazil.png', url: 'America/Sao_Paulo');
    await instance.getTime();

    //print(instance.time);
    setState(() {
      time = instance.time;
    });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50),
      child: Text(time),
    ));
  }
}

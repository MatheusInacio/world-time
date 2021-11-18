import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = '';
  String time = '';
  String flag = '';
  String url = ''; //America/Sao_Paulo

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      //print('buscanco tempo');

      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      //Response response = await get(
      //    Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];

      String offset = data['utc_offset'];
      if (offset.startsWith('-')) {
        offset = data['utc_offset'].substring(0, 3);
      } else {
        offset = data['utc_offset'].substring(1, 3);
      }

      DateTime dt = DateTime.parse(datetime);
      dt = dt.add(Duration(hours: int.parse(offset)));

      //print(dt);

      time = DateFormat.jm().format(dt);
    } catch (e) {
      print('erro no getTime: $e');
      time = 'não obteve retorno';
    }
  }
}

WorldTime instance = WorldTime(
    location: 'Jacarezinho', flag: 'Brazil.png', url: 'America/Sao_Paulo');

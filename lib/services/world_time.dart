import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String flag;
  String url;
  String time;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});




    Future<void> getTime() async {

      try {
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);
        //print(response.body);
        String datetime = data['datetime'];
        String hour_offset = data['utc_offset'].substring(1, 3);
        String min_offset = data['utc_offset'].substring(4, 6);
//    print(datetime);
//      print(offset);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(hour_offset), minutes: int.parse(min_offset)));
        isDaytime = now.hour >6 && now.hour<18 ? true : false;
        time = DateFormat.jm().format(now);

      }
      catch (e) {

        print('caught error: $e');
        time = 'Could not fetch data';

      }
    }
}
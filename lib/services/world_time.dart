import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //url of the api
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //Get the data from API
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');

      //Change json to map
      Map data = jsonDecode(res.body);
      //print(data);

      String dateTime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4);
      //print(dateTime);
      //print(offset);

      //Convert string to DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(
        Duration(
          hours: int.parse(offsetHour),
          minutes: int.parse(offsetMin),
        ),
      );

      isDayTime = (now.hour > 5) && (now.hour < 19) ? true : false;
      //Set the time property
      time = DateFormat.jm().format(now);
    } catch (err) {
      print('Caught an Error $err');
      time = 'Oops!!! Could not get time';
    }
  }
}

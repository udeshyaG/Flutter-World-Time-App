import 'package:flutter/material.dart';
import '../services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateLocation(index) async {
    WorldTime obj = locations[index];

    await obj.getTime();

    Navigator.pop(context, {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
      'isDayTime': obj.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose Location'),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateLocation(index);
                    },
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('images/${locations[index].flag}'),
                    ),
                    title: Text('${locations[index].location}'),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

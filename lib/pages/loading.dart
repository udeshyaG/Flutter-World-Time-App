import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime obj = new WorldTime(
        location: 'Kolkata', url: 'Asia/Kolkata', flag: 'india.png');
    await obj.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
      'isDayTime': obj.isDayTime,
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

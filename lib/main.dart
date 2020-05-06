import 'package:flutter/material.dart';
import 'package:worldclockninja/pages/home.dart';
import 'package:worldclockninja/pages/loading.dart';
import 'package:worldclockninja/pages/choose_location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ));

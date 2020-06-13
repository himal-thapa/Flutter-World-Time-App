

import 'package:flutter/material.dart';
import 'package:worldtime/Pages/choose_location.dart';
import 'package:worldtime/Pages/home.dart';
import 'package:worldtime/Pages/loading.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home' : (context) => Home(),
    '/location': (context) => ChooseLocation(),

  },
));

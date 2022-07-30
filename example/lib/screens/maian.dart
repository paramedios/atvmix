import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './home.dart';
import './create.dart';
import './details.dart';
import './third_screen.dart';
import './homepage.dart';


class Appss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + PHP CRUD',
      initialRoute: '/',

      routes: {
        '/': (context) => Home(),
        '/create': (context) => Create(),
        '/details': (context) => Details(),
        '/edit': (context) => Create(),
      },

    );


  }
}



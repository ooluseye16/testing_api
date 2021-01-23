import "package:flutter/material.dart";

import 'package:testing_api/searchPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Texting Api",
      home: SearchPage(),
    );
  }
}


// ListTile(
//                     title:
//                     subtitle:
//                   );

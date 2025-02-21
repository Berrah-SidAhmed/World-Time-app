
import 'package:flutter/material.dart';

import 'package:time_app/loading.dart';
import 'package:time_app/home.dart';
import 'package:time_app/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Banner(message: 'erox', location: BannerLocation.topStart,color: Colors.green,),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/second': (context) => Home(),
        '/third': (context) => Location(),
      },
    );
  }
}

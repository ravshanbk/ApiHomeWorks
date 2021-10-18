import 'package:apihomeworks0/Currency/mainpage.dart';
import 'package:apihomeworks0/PrayerTimes/prayertimeshome.dart';
import 'package:apihomeworks0/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/hwapi",
      routes: {
        "/hwapi": (context) => const HomeworkHomePage(),
        "/hwapi0": (context) => const PrayerTimesHome(),
        "/hwapi1": (context) => const Currency(),
        "/hwapi2": (context) => const Currency(),
        "/hwapi3": (context) => const Currency(),
        "/hwapi4": (context) => const Currency(),
      },
     // home: const HomeworkHomePage(),
    );
  }
}

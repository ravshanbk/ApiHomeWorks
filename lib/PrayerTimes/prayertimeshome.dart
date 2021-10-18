// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:apihomeworks0/MyPackages/floatingactionbutton.dart';
import 'package:apihomeworks0/PrayerTimes/modelPrayertime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrayerTimesHome extends StatelessWidget {
  const PrayerTimesHome({Key? key}) : super(key: key);
  static const String _url =
      "http://api.aladhan.com/v1/calendarByCity?city=Tashkent&country=Uzbekistan&method=2&month=10&year=2021";
  Future<PrayerTime> _getData1() async {
    PrayerTime? priyertime;
    try {
      var res = await http.get(Uri.parse(_url));
      var decodedJson = json.decode(res.body);
      priyertime = PrayerTime.fromJson(decodedJson);
      return priyertime;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: const MyPackageFloatingActionButton(),
      backgroundColor: const Color(0xff188c56),
      body: _getBody(_height, _width),
    );
  }

  _getBody(_height, _width) {
    return SizedBox(
      height: _height,
      width: _width,
      child: Stack(
        children: [
          _topSide(_height, _width),
          _bottomSide(_height, _width, false),
          _bottomSide(_height, _width, true),
        ],
      ),
    );
  }

  _topSide(_height, _width) {
    return Container(
      height: _height,
      width: _width,
      alignment: Alignment(1.9, -1.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
      ),
      child: Container(
        height: _height * 0.5,
        width: _width * .96,
        decoration: BoxDecoration(
            border: Border.fromBorderSide(
                BorderSide(width: 5.0, color: Colors.white)),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                _width * .75,
                _width * .75,
              ),
              bottomRight: Radius.elliptical(
                _width * .3,
                _width * .05,
              ),
              topLeft: Radius.elliptical(
                _width * .1,
                _width * .4,
              ),
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/tashkent.jpeg"))),
      ),
    );
  }

  _bottomSide(_height, _width, x) {
    return Container(
      height: _height,
      width: _width,
      alignment: Alignment(-1.9, 1.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3.0),
      ),
      child: Container(
        height: _height * 0.67,
        width: _width * .93,
        decoration: _bottomSideDecoration(_height, _width, x),
        child: FutureBuilder(
          future: _getData1(),
          builder: (context, AsyncSnapshot<PrayerTime> snap) {
            var data = snap.data;
            return snap.hasData
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 70.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _getTextInRow(
                          "Fajr",
                          (data!.data![0].timings!.fajr)
                              .toString()
                              .substring(0, 5),
                        ),
                        _getTextInRow(
                          "Sunrise",
                          (data.data![0].timings!.sunrise)
                              .toString()
                              .substring(0, 5),
                        ),
                        _getTextInRow(
                          "Dhuhr",
                          (data.data![0].timings!.dhuhr)
                              .toString()
                              .substring(0, 5),
                        ),
                        _getTextInRow(
                          "Asr",
                          (data.data![0].timings!.asr)
                              .toString()
                              .substring(0, 5),
                        ),
                        _getTextInRow(
                          "Maghrib",
                          (data.data![0].timings!.maghrib)
                              .toString()
                              .substring(0, 5),
                        ),
                        _getTextInRow(
                          "Isha'a",
                          (data.data![0].timings!.isha)
                              .toString()
                              .substring(0, 5),
                        ),
                        SizedBox(height: _height * 0.01,),
                        Text("Untill Dhuhr time",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900,),),
                        Divider(color: Colors.teal[900],thickness: 1.5,endIndent: 150.0,),
                        Text("05 : 13 : 54",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,),),

                      ],
                    ),
                  )
                : Center(
                    child: CupertinoActivityIndicator(
                      radius: 50.0,
                    ),
                  );
          },
        ),
      ),
    );
  }

  _getTextInRow(String _prayer, String data) {
    const TextStyle _textStyle = TextStyle(fontSize: 24.0);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_prayer, style: _textStyle),
          Text(data, style: _textStyle),
        ],
      ),
      Divider(
        color: Colors.grey,
        endIndent: 10.0,
        indent: 10.0,
      )
    ],);
  }

  _bottomSideDecoration(_height, _width, x) {
    return BoxDecoration(
      color: x ? Colors.white : Colors.grey[400],
      borderRadius: BorderRadius.only(
        topRight: Radius.elliptical(
          _width * .8,
          _width * .8,
        ),
        topLeft: Radius.elliptical(
          _width * .3,
          _width * .05,
        ),
        bottomRight: Radius.elliptical(
          x ? _width * .6 : _width * .4,
          x ? _width * .7 : _width * .6,
        ),
      ),
    );
  }
}

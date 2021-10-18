import 'dart:convert';
import 'dart:ui';

import 'package:apihomeworks0/Currency/countpage.dart';
import 'package:apihomeworks0/Currency/nbumodel.dart';
import 'package:apihomeworks0/MyPackages/floatingactionbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: const MyPackageFloatingActionButton(),
      appBar: _getAppBar(),
      bottomNavigationBar: _getBottomNavigationBar(),
      body: _getBody(_size),
    );
  }

  Future<List<Nbu>> _getData() async {
    Uri url = Uri.parse("https://nbu.uz/en/exchange-rates/json/");
    var res = await http.get(url);

    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => Nbu.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato Bor : ${res.statusCode}");
    }
  }

  _getFutureBuilder(_size) {
    return Container(
      height: _size.height,
      margin:const EdgeInsets.only(top: 10.0),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 2.0, color: Colors.blue))),
      child: FutureBuilder(
        future: _getData(),
        builder: (context, AsyncSnapshot<List<Nbu>> snap) {
          var data = snap.data;

          return (snap.hasData)
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onDoubleTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountPage(data!, index)));
                      },
                      child: ListTile(
                        selected: false,
                        visualDensity: const VisualDensity(vertical: 4.0),
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 55.0,
                              width: 75.0,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(-2.5, -1.5),
                                      color: Colors.grey,
                                      spreadRadius: 2.0,
                                      blurRadius: 10.0)
                                ],
                                color: Colors.green,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/flag$index.png"),
                                ),
                              ),
                            ),
                            Text(
                              "${data![index].code}",
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                letterSpacing: 3.0,
                                decorationStyle: TextDecorationStyle.double,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              "so'm  ${data[index].cbPrice}",
                              style: const TextStyle(fontSize: 18.0),
                            ),
DropdownButton(items: const []),                          ],
                        ),
                        title: Text(
                          "${data[index].title}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        subtitle: Text(
                          "${data[index].date}",
                          style: const TextStyle(),
                        ),
                      ),
                    );
                  },
                  itemCount: data!.length,
                )
              : const Center(
                  child: CupertinoActivityIndicator(
                    radius: 150.0,
                  ),
                );
        },
      ),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.cyan,
          activeIcon: Icon(
            Icons.home_mini,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "Mode",
          backgroundColor: Colors.cyan,
          activeIcon: Icon(
            Icons.home_mini,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.travel_explore_outlined,
          ),
          label: "World Time",
          backgroundColor: Colors.cyan,
          activeIcon: Icon(
            Icons.home_mini,
          ),
        ),
      ],
    );
  }

  _getAppBar() {
    return AppBar(
      leading: const SizedBox(
        child: Image(
          image: AssetImage("assets/images/nbulogo.png"),
          fit: BoxFit.contain,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "NBU Currency Exchange",
        style: TextStyle(color: Colors.blue[900], fontSize: 23.0),
      ),
    );
  }

  _getBody(_size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _getFutureBuilder(_size),
        ],
      ),
    );
  }
}

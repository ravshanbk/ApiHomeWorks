import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  final List data;
  final int index;
   const CountPage(this.data, this.index, {Key? key}) : super(key: key);
  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getBackButton(),
            const Divider(
              thickness: 2.0,
              color: Colors.grey,
            ),
            _getListTile(_size),
          ],
        ),
      ),
    );
  }

  _getListTile(_size) {
    return ListTile(
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
                image: AssetImage("assets/images/flag${widget.index}.png"),
              ),
            ),
          ),
          Text(
            "${widget.data[widget.index].code}",
            style:const TextStyle(
              decoration: TextDecoration.underline,
              letterSpacing: 3.0,
              decorationStyle: TextDecorationStyle.double,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: Text(
        "so'm: ${widget.data[widget.index].cbPrice}",
        style: const TextStyle(fontSize: 18.0),
      ),
      title: Text(
        "${widget.data[widget.index].title}",
        style:  const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      subtitle: Text(
        "${widget.data[widget.index].date}",
        style:const TextStyle(),
      ),
    );
  }

  _getBackButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children:const [
                  Icon(Icons.arrow_back_ios, size: 20.0),
                  // Text("Back",style: TextStyle(fontSize: 20.0),)
                ],
              )),
          Text(
            "${widget.data[widget.index].title}",
            style: const TextStyle(fontSize: 29.0),
          ),
          _getFlagBox(),
        ],
      ),
    );
  }

  _getFlagBox() {
    return Container(
      height: 55.0,
      width: 75.0,
      decoration: BoxDecoration(
        boxShadow: const[
          BoxShadow(
              offset: Offset(-2.5, -1.5),
              color: Colors.grey,
              spreadRadius: 2.0,
              blurRadius: 10.0)
        ],
        color: Colors.green,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/flag${widget.index}.png"),
        ),
      ),
    );
  }
}

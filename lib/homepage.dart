import 'package:flutter/material.dart';

class HomeworkHomePage extends StatelessWidget {
  const HomeworkHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _titleOfHomeWorks = [
      ["Praying Times","11/ 10/ 2021"],
      ["Currency", "08/ 10/ 2021"],
      ["Music List API", "13/ 10/ 2021"],
      ["Car Images", "14/ 10/ 2021"],
      ["Music App", "12/ 10/ 2021"],
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          child: ListView.builder(
            itemCount: _titleOfHomeWorks.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                ListTile(
                  onTap: (){
                     Navigator.pushNamedAndRemoveUntil(
                        context, "/hwapi$index", (t) => false);
                  },
                  minLeadingWidth: 110.0,
                  minVerticalPadding: 20.0,
                  visualDensity: const VisualDensity(vertical: 4.0),
                  leading: Container(
                    decoration:   BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/hwapi$index.jpg"),
                      fit: BoxFit.cover,
                    ),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow:const [  BoxShadow( color: Colors.grey, spreadRadius: 3.0,blurRadius: 3.0,offset: Offset(-1, -1))]
                    ),
                    height: 75.0,
                    width:97.0,
                    
                  ),
                  title: Text(
                    _titleOfHomeWorks[index][0],
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  subtitle: Text(
                    _titleOfHomeWorks[index][1],
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                   const SizedBox(
                    height: 10.0,
                   ),
                  const Divider(
                    height: 1.0,
                    color: Colors.black,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

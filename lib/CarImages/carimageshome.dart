import 'package:apihomeworks0/MyPackages/floatingactionbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CarImagesHome extends StatelessWidget {
  const CarImagesHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(floatingActionButton: MyPackageFloatingActionButton(),
      body: Center(child: CupertinoActivityIndicator(radius: 50.0,),),
      
    );
  }
}
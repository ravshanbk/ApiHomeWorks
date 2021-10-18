import 'package:apihomeworks0/homepage.dart';
import 'package:flutter/material.dart';


class MyPackageFloatingActionButton extends StatelessWidget{
  const MyPackageFloatingActionButton({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return 
     FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(
              builder:(context)=>  const HomeworkHomePage(),),);
            //(route) => false);
        },
        child: const Icon(Icons.home,size: 35,),);

    
  }  
}
  

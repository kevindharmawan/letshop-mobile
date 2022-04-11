import 'package:flutter/material.dart';

class Header extends StatelessWidget{




  @override
  Widget build(BuildContext context) {

         return Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              SizedBox(height:0.04),
                 Text("Welcome back!", style: TextStyle(fontSize: 30, color:Colors.black,),
               )
              ]
             )

         );

   }
}
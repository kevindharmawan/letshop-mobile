import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.lightBlue[700],
            borderRadius: BorderRadius.circular(5.0),
          ),
            child: Center(
            child: Text("Login",style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
             ),
            ),
          ),

       );
  }
}

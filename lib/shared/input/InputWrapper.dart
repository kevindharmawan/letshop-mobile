import 'package:flutter/material.dart';

import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: InputField(),
          ),

          SizedBox(height: 10,),
          Container(
            alignment: Alignment.bottomLeft,
              margin: new EdgeInsets.symmetric( horizontal: 50.0),
             child: Text("Forgot your password?",
               style: TextStyle(color: Colors.lightBlue),
             )
          ),
          SizedBox(height: 80,),
          Button(),

          SizedBox(height: 20,),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black87)),
              TextSpan(
                  text: " Register",
                  style: TextStyle(
                      color: Colors.lightBlue)),
            ]),
          )
        ],
      ),
    );
  }
}
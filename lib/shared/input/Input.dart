import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  TextEditingController unameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController pymntController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: unameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'User Name',
                hintText: 'Enter Your Name',
                icon: Icon(Icons.person_outline),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)

                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter Your Email',
                icon: Icon(Icons.mail_outline),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pwdController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  icon: Icon(Icons.password_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pymntController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'Enter Your Card Number',
                  icon: Icon(Icons.credit_card_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
          ),
        ]);
  }
}
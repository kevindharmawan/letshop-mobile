import 'package:flutter/material.dart';

class InputField extends StatelessWidget{
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
    ]);
  }
}
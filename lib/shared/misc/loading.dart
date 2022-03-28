import 'package:flutter/material.dart';

// TODO: Change color
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/third');
          },
          child: Text('Go to Third Screen'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int currentPageIndex = 1;

  final List<String> routes = ['/', '/second', '/third'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Second Screen'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              icon: Icon(Icons.arrow_back))),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/third', (route) => false);
          },
          child: const Text('Go to Third Screen'),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          Navigator.pushNamedAndRemoveUntil(
              context, routes[index], (route) => false);
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.looks_one),
            label: 'First Page',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_two),
            label: 'Second Page',
          ),
          NavigationDestination(
            icon: Icon(Icons.looks_3),
            label: 'Third Page',
          ),
        ],
      ),
    );
  }
}

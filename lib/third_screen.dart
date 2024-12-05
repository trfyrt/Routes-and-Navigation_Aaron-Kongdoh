import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int currentPageIndex = 2; // Indeks untuk ThirdScreen

  final List<String> routes = ['/', '/second', '/third'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          child: const Text('Go Back to First Screen'),
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

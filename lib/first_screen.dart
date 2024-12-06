import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentPageIndex = 0;
  final TextEditingController _controller = TextEditingController();
  int? numberOfScreens;

  final List<String> routes = ['/', '/second', '/third'];

  @override
  Widget build(BuildContext context) {
    final String receivedData =
        ModalRoute.of(context)?.settings.arguments as String? ??
            'No Data Passed';
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dynamic Routing'),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter number of screens (max: 200)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      numberOfScreens = int.tryParse(value);
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (numberOfScreens != null &&
                        numberOfScreens! > 0 &&
                        numberOfScreens! <= 200) {
                      Navigator.pushNamed(
                        context,
                        '/dynamic',
                        arguments: numberOfScreens,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please enter a valid number between 1 and 200',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Generate Pages')),
              const SizedBox(height: 40),
              Text(receivedData),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/second', (route) => false,
                      arguments: 'Hello from first screen');
                },
                child: const Text('Go to Second Screen'),
              )
            ]),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          Navigator.pushNamedAndRemoveUntil(
              context, routes[index], (route) => false,
              arguments: 'Hello from first screen');
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

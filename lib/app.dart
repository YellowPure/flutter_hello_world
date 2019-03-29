import 'package:flutter/material.dart';

enum TabItem {red, yellow, green}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Favorite'),
    Text('Index 2: Text')
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    return new Text('data');
  }
}
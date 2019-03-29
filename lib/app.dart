import 'package:flutter/material.dart';

enum TabItem {red, yellow, green}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Favorite'),
    Text('Index 2: Text')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('favorite')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('school')),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: _widgetOptions.elementAt(_currentIndex),
    );
  }
}
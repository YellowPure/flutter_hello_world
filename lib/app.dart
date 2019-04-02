import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'layout.dart';
import 'home.dart';
import 'school.dart';
import 'todos.dart';

enum TabItem {red, yellow, green}

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
  final _widgetOptions = [
    new Home(),
    new Layout(),
    new TodoPage(),
    new School(),
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
        fixedColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('favorite')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('todo')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('school')),
        ],
      ),
    );
  }

  Widget _buildBody() {
    // return Container(
    //   color: Colors.red,
    //   alignment: Alignment.center,
    //   child: FlatButton(
    //     child: Text(
    //       'PUSH',
    //       style: TextStyle(fontSize: 32.0, color: Colors.white)
    //     ),
    //     onPressed: _push,
    //   ),
    // );
    return Center(
      child: _widgetOptions.elementAt(_currentIndex),
    );
  }
}
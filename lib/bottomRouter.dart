import 'package:flutter/material.dart';

class BottomRouter extends DefaultTabController{
  @override
  Widget build() {
    // return new DefaultTabController(
    //   length: ,
    // )
  }
}

class Choice {
  const Choice ({ this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice> [
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'List', icon: Icons.list),
  const Choice(title: 'Favorite', icon: Icons.favorite),
  const Choice(title: 'Flex', icon: Icons.flag)
];
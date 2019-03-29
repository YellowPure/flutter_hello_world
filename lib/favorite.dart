import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final String title;
  final Iterable<Widget> divied;

  Favorite(this.title, this.divied);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text(this.title),
      ),
      body: new ListView(children: this.divied),
    );
  }
}
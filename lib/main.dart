import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
// import './layout.dart';
// import './favorite.dart';
import './app.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new App(),
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pressed,),
          new IconButton(icon: new Icon(Icons.flag), onPressed: _toLayout,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _toLayout() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          // return new Layout();
        }
      )
    );
  }

  void _pressed() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles =_saved.map((pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });
          final divied = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          // return new Favorite('Saved Suggestions', divied);
          // return new Scaffold(
          //   appBar: new AppBar(
          //     title: new Text('Saved Suggestions'),
          //   ),
          //   body: new ListView(children: divied),
          // );
        }
      )
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;

        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
          
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair) {
    final alreadySaved =_saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style:_biggerFont,
      ),
      trailing: new Icon(
        alreadySaved? Icons.favorite : Icons.favorite_border,
        color: alreadySaved? Colors.red: null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}



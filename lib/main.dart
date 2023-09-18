import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/navigator/tab_navigator.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lovewww',
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: TabNavigator()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key : key);
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _words = <WordPair>[];
  final _myWords = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    _words.addAll(generateWordPairs().take(10));
    return Scaffold(
      appBar: AppBar(
        title: const Text('配对12'),
        actions: [
          IconButton(onPressed: _gotoLoved, icon: const Icon(Icons.list))
        ],
      ),
      body: Center(
        child: _buildList()
        // Text(generateWordPairs().first.asCamelCase)
      )
    );
  }

  void _gotoLoved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> titles = _myWords.map((wp) {
            return ListTile(
              title: Text(wp.asCamelCase)
            );
          });
          return Scaffold(
            appBar: AppBar(title: const Text('我的喜欢'),),
            body: ListView(children: titles.toList())
          );
        }
      )
    );
  }

  Widget _buildList() {
    return ListView.builder(
      // itemCount: 10,
      itemBuilder: (context, item) {
        if(item.isOdd) {
          return const Divider();
        } else {
          int index = item ~/ 2;
          if (index >= _words.length) {
            _words.addAll(generateWordPairs().take(10));
          }
          return _buildRow(index);
        }
        
      }
    );
  }

  Widget _buildRow(index) {
    WordPair wp = _words[index];
    return ListTile(
      title: Text(wp.asCamelCase),
      trailing: _buildLoveIcon(wp),
      onTap: () => _addToLove(wp),
    );
  }

  _buildLoveIcon(WordPair wp) {
    if (_myWords.contains(wp)) {
      return const Icon(Icons.favorite, color: Colors.red);
    } else {
      return const Icon(Icons.favorite_border);
    }
  }

  void _addToLove(WordPair wp) {
    setState(() {
      if (_myWords.contains(wp)) {
        _myWords.remove(wp);
      } else {
        _myWords.add(wp);
      }
    });
    print(_myWords);
  }
}
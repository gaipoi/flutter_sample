import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Dartではメソッドの先頭に戻り値を記述する
void main() => runApp(MyApp());

// StatelessWidgetはbuildメソッドを持っていてWidgetもしくはTextを返す
// StatelessWidgetは状態管理の機能がないため、動的に更新されない
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App Widget!!',
      home: RandomWords()
    );
  }
}

// StateクラスのジェネリクスとしてRandomWordsを指定し、RandomWordsウィジェットの状態を維持できるようにする
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggestFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('TEST TITLE'),
    ),
    body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
          pair.asPascalCase,
          style: _biggestFont),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
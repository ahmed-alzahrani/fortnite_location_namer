import 'package:flutter/material.dart';
import 'package:fortnite_location_namer/LocationGenerator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortnite Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => RandomLocationsState();
}

class RandomLocationsState extends State<RandomWords> {
  final _suggestions = <String>[];
  final _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _locationGenerator = new LocationGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Fortnite Location Generator'),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(String location) {
    final alreadySaved = _saved.contains(location);
    return ListTile(
      title: Text(
        location,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(location);
          } else {
            _saved.add(location);
          }
        });
      }
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(_locationGenerator.generateTenLocations().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
              (location) {
                return ListTile(
                  title: Text(
                    location,
                    style: _biggerFont,
                  ),
                );
              },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Locations'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/widgets/home_page.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  var _current = WordPair.random();
  var _favorites = <WordPair>[];

  List<WordPair> getFavorites() {
    return _favorites;
  }

  WordPair getCurrent() {
    return _current;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 26, 66, 197)),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _themeMode,
      home: HomePage(),
    );
  }

  void changeTheme() {
    var newTheme = _themeMode;
    if (ThemeMode.light != newTheme) {
      newTheme = ThemeMode.light;
    } else {
      newTheme = ThemeMode.dark;
    }
    print(Theme.of(context).brightness);
    setState(() {
      _themeMode = newTheme;
    });
  }

  void getNext() {
    var current = WordPair.random();
    setState(() {
      _current = current;
    });
  }

  void toggleFavorite() {
    if (_favorites.contains(_current)) {
      _favorites.remove(_current);
    } else {
      _favorites.add(_current);
    }
  }
}

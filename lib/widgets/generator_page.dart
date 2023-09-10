import 'package:flutter/material.dart';
import 'package:namer_app/widgets/app.dart';
import 'package:namer_app/widgets/bigcard.dart';
import 'package:namer_app/widgets/darkmode_button.dart';

class GeneratorPage extends StatefulWidget {
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  bool _hasChanged = false;

  @override
  Widget build(BuildContext context) {
    var appState = MyApp.of(context);
    var pair = appState.getCurrent();
    var favorites = appState.getFavorites();

    IconData icon;
    print(favorites);
    if (favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                  setState(() {
                    _hasChanged = !_hasChanged;
                  });
                },
                icon: Icon(icon),
                label: Text('Favoritar'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Próximo'),
              ),
              SizedBox(width: 10),
              DarkModeButton(),
            ],
          ),
        ],
      ),
    );
  }
}

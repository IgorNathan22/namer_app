import 'package:flutter/material.dart';
import 'package:namer_app/widgets/app.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = MyApp.of(context);
    var favorites = appState.getFavorites();

    if (favorites.isEmpty) {
      return Center(
        child: Text('Sem opções favoritadas.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Você possuí '
              '${favorites.length} favoritos:'),
        ),
        for (var pair in favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

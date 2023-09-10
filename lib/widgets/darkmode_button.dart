import 'package:flutter/material.dart';
import 'package:namer_app/widgets/app.dart';

class DarkModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = MyApp.of(context);

    return ElevatedButton(
        onPressed: () {
          state.changeTheme();
        },
        child: Text('Modo Escuro'));
  }
}

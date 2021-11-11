import 'package:flutter/material.dart';
import 'package:shared_preferences_app/src/shared_prefs/preferencias_usuario.dart';

import 'package:shared_preferences_app/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static const String routName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        centerTitle: true,
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(thickness: 1.0),
          Text('Genero: ${prefs.genero}'),
          Divider(thickness: 1.0),
          Text('Nombre usuario: ${prefs.nombreUsuario}'),
          Divider(thickness: 1.0),
        ],
      ),
    );
  }
}

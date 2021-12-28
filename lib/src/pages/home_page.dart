import 'package:flutter/material.dart';
import 'package:shared_preferences_app/src/shared_prefs/preferencias_usuario.dart';

import 'package:shared_preferences_app/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static const String routName = 'home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferenciasUsuario.ultimaPagina = HomePage.routName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias de Usuario'),
        centerTitle: true,
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(PreferenciasUsuario.isDarkmode ? 'Modo: Oscuro' : 'Modo: Claro'),
          const Divider(thickness: 1.0),
          Text(PreferenciasUsuario.gender == 1 ? 'Genero: Masculino' : 'Genero: Femenino'),
          const Divider(thickness: 1.0),
          Text('Nombre usuario: ${PreferenciasUsuario.name}'),
          const Divider(thickness: 1.0),
        ],
      ),
    );
  }
}

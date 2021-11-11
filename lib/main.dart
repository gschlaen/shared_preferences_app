import 'package:flutter/material.dart';

import 'package:shared_preferences_app/src/pages/home_page.dart';
import 'package:shared_preferences_app/src/pages/settings_page.dart';
import 'package:shared_preferences_app/src/shared_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Necesario cuando se debe esperar a que se ejecute algo antes de correr la app

  final prefs = PreferenciasUsuario();
  await prefs.initPrefs(); //Asegura que no inicie la app hasta que no se carguen e inicialicen las preferencias

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferences',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routName: (BuildContext context) => HomePage(),
        SettingsPage.routName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}

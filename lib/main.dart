import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/providers/theme_provider.dart';

import 'package:shared_preferences_app/src/pages/home_page.dart';
import 'package:shared_preferences_app/src/pages/settings_page.dart';
import 'package:shared_preferences_app/src/shared_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Necesario cuando se debe esperar a que se ejecute algo antes de correr la app

  await PreferenciasUsuario.initPrefs(); //Asegura que no inicie la app hasta que no se carguen e inicialicen las preferencias

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkmode: PreferenciasUsuario.isDarkmode))],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferences',
      initialRoute: PreferenciasUsuario.ultimaPagina,
      routes: {
        HomePage.routName: (BuildContext context) => const HomePage(),
        SettingsPage.routName: (BuildContext context) => const SettingsPage(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}

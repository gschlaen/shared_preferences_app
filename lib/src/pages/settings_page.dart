import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_app/providers/theme_provider.dart';

import 'package:shared_preferences_app/src/shared_prefs/preferencias_usuario.dart';
import 'package:shared_preferences_app/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static const String routName = 'settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // bool isDarkmode = PreferenciasUsuario.isDarkmode;
  // int gender = PreferenciasUsuario.gender;
  //final String _nombre = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
          centerTitle: true,
        ),
        drawer: const MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(5.0),
                child: const Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold))),
            const Divider(thickness: 1.0),
            SwitchListTile.adaptive(
              value: PreferenciasUsuario.isDarkmode,
              title: const Text('Darkmode'),
              onChanged: (value) {
                PreferenciasUsuario.isDarkmode = value;
                final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                setState(() {});
              },
            ),
            RadioListTile<int>(
              value: 1, // Asigna un valor a cada radio list tile
              groupValue: PreferenciasUsuario.gender, // Indica cual radio list Tile va a estar checked
              title: const Text('Masculino'),
              onChanged: (value) {
                PreferenciasUsuario.gender = value ?? 1;
                setState(() {});
              },
            ),
            RadioListTile<int>(
              value: 2,
              groupValue: PreferenciasUsuario.gender,
              title: const Text('Femenino'),
              onChanged: (value) {
                PreferenciasUsuario.gender = value ?? 2;
                setState(() {});
              },
            ),
            const Divider(thickness: 1.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                initialValue: PreferenciasUsuario.name,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Ingresa tu nombre',
                ),
                onChanged: (value) {
                  PreferenciasUsuario.name = value;
                  setState(() {});
                },
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

import 'package:shared_preferences_app/src/shared_prefs/preferencias_usuario.dart';
import 'package:shared_preferences_app/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static const String routName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? _colorSecundario;
  int? _genero;
  //final String _nombre = 'Pedro';

  late TextEditingController _textController; // late indica a flutter que luego voy a inicializar el controlador

  final prefs = PreferenciasUsuario();

  // Se dispara cuando se inicializa el estado antes del Build
  @override
  void initState() {
    super.initState();

    prefs.ultimaPagina = SettingsPage.routName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = TextEditingController(text: prefs.nombreUsuario);
  }

  _getSelectedRadio(int? value) {
    prefs.genero = value ?? 1;
    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          centerTitle: true,
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold))),
            Divider(thickness: 1.0),
            SwitchListTile(
              value: _colorSecundario!,
              title: Text('Color secundario'),
              onChanged: (value) {
                prefs.colorSecundario = value;
                _colorSecundario = value;
                setState(() {});
              },
            ),
            RadioListTile(
              value: 1, // Asigna un valor a cada radio list tile
              title: Text('Masculino'),
              groupValue: _genero, // Indica cual radio list Tile va a estar checked
              onChanged: _getSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _getSelectedRadio,
            ),
            Divider(thickness: 1.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Ingresa tu nombre',
                ),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}

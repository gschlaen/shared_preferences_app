import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Crea la instancia
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  //Cuando se ejecute el constructor simple se retorna la instancia, y siempre sera la misma instancia
  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs; //late indica que ahora no tiene valor pero cuando se use lo va a tener

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GET y SET del genero
  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  //GET y SET del colorSecundario
  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //GET y SET del nombreUsuario
  String get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  //GET y SET del ultima pagina
  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}

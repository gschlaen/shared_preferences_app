import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;
  static String _ultimaPagina = 'home';

  static Future initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GET y SET del genero
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }

  //GET y SET del colorSecundario
  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value);
  }

  //GET y SET del nombreUsuario
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String value) {
    _name = value;
    _prefs.setString('name', value);
  }

  //GET y SET del ultima pagina
  static String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? _ultimaPagina;
  }

  static set ultimaPagina(String value) {
    _ultimaPagina = value;
    _prefs.setString('ultimaPagina', value);
  }
}

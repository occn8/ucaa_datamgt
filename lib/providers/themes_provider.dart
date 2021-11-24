import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucaa_datamgt/index.dart';

class AppPreference {
  static const themeSetting = "themeSetting";

  setThemePref(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeSetting, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeSetting) ?? false;
  }
}

class ThemeModel extends ChangeNotifier {
  AppPreference appPreference = AppPreference();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    appPreference.setThemePref(value);
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.green,
  primaryColorDark: Colors.green,
  primaryColorLight: Colors.green,
  brightness: Brightness.dark,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.grey[200],
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
    headline5: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
    button: TextStyle(color: Colors.black),
    subtitle1: TextStyle(color: Colors.black),
    subtitle2: TextStyle(color: Colors.black),
    caption: TextStyle(color: Colors.black),
    overline: TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.green,
  brightness: Brightness.light,
  backgroundColor: const Color(0xff2f2f2f),
  scaffoldBackgroundColor: const Color(0xff1d1d1d),
  cardColor: const Color(0xff424242),
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
);

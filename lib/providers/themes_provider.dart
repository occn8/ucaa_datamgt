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

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.green,
  // splashColor: Colors.green,
  brightness: Brightness.dark,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  // primaryColorLight: Colors.grey[300],
  // primaryColorDark: Colors.black,
  // cardColor: Colors.grey[200],
  // canvasColor: Colors.white,
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
    headline5: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.green,
  brightness: Brightness.light,
  backgroundColor: const Color(0xff2f2f2f),
  scaffoldBackgroundColor: const Color(0xff1d1d1d),
  // primaryColorLight: Colors.black,
  // primaryColorDark: Colors.white,
  // cardColor: Color(0xff424242),
  // canvasColor: Color(0xff333333),
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

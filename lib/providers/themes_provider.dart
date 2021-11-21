import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucaa_datamgt/index.dart';

class AppPreference {
  static const THEME_SETTING = "THEMESETTING";

  setThemePref(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_SETTING, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_SETTING) ?? false;
  }
}

class AppModel extends ChangeNotifier {
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
  fontFamily: 'Gilroy', //'Montserrat'
  primaryColor: Color(0xffffb200),
  splashColor: Color(0xffffb300),
  accentColor: Color(0xffe59a00),
  brightness: Brightness.dark,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColorLight: Colors.grey[300],
  primaryColorDark: Colors.black,
  cardColor: Colors.grey[200],
  canvasColor: Colors.white,
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
    headline5: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
  buttonColor: Colors.orangeAccent,
);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Gilroy',
  primaryColor: Color(0xffffb200),
  accentColor: Color(0xffe59a00),
  brightness: Brightness.light,
  backgroundColor: Color(0xff2f2f2f),
  scaffoldBackgroundColor: Color(0xff1d1d1d),
  primaryColorLight: Colors.black,
  primaryColorDark: Colors.white,
  // cardColor: Color(0xff333333),
  cardColor: Color(0xff424242),
  canvasColor: Color(0xff333333),
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
  // inputDecorationTheme: InputDecorationTheme(
  // border: const OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.grey)),
  // focusedBorder: const OutlineInputBorder(
  //     borderSide: BorderSide(color: Color(0xffffb300))),
  // // enabledBorder: const OutlineInputBorder(
  // //     borderSide: BorderSide(color: Color(0xffffb300))),
  // errorBorder:
  //     const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  // focusedErrorBorder: const OutlineInputBorder(
  //     borderSide: BorderSide(color: Colors.redAccent)),
  // ),
  buttonColor: Colors.orangeAccent,
);

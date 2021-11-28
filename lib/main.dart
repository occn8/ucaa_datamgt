import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ucaa_datamgt/auth_status.dart';
import 'package:ucaa_datamgt/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DesktopWindow.setMinWindowSize(const Size(600, 800));
  await Firebase.initializeApp();
  if (!kIsWeb)
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.white,
    ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

String? usrrole;

class _MyAppState extends State<MyApp> {
  ThemeModel appModel = ThemeModel();

  @override
  void initState() {
    super.initState();
    _initTheme();
    getRole();
  }

  void _initTheme() async {
    appModel.darkTheme = await appModel.appPreference.getTheme();
  }

  getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String aaa = prefs.getString('userRole') ?? 'Admin';
    usrrole = aaa;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>.value(value: appModel),
      ],
      child: Consumer<ThemeModel>(builder: (context, value, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UCAA Data Mgt',
          theme: appModel.darkTheme ? darkTheme : lightTheme,
          home: const AuthStatus(),
        );
      }),
    );
  }
}

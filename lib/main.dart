import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:ucaa_datamgt/auth_status.dart';
import 'package:ucaa_datamgt/index.dart';
import 'package:ucaa_datamgt/providers/themes_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

class _MyAppState extends State<MyApp> {
  AppModel appModel = AppModel();
  @override
  void initState() {
    super.initState();
    _initTheme();
  }

  void _initTheme() async {
    appModel.darkTheme = await appModel.appPreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppModel>.value(value: appModel),
      ],
      child: Consumer<AppModel>(builder: (context, value, child) {
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

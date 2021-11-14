import 'package:ucaa_datamgt/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UCAA Data Mgt',
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        backgroundColor: Colors.white,
      ),
      home: const Home(),
    );
  }
}

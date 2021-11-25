import 'package:ucaa_datamgt/index.dart';

class Lander extends StatefulWidget {
  const Lander({Key? key}) : super(key: key);

  @override
  _LanderState createState() => _LanderState();
}

class _LanderState extends State<Lander> {
  getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String aaa = prefs.getString('userRole') ?? 'Viewer';
    usrrole = aaa;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getRole();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
    return Container();
  }
}

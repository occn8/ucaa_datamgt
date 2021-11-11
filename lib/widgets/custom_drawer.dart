import 'package:ucaa_datamgt/index.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 50),
          ListTile(
            title: const Text('Home'),
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

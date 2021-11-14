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
          Divider(),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 28,
              color: Theme.of(context).primaryColorDark,
            ),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              size: 28,
              color: Theme.of(context).primaryColorDark,
            ),
            title: const Text('Users'),
            onTap: () {},
          ),
          const SizedBox(height: 50),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 28,
              color: Theme.of(context).primaryColorDark,
            ),
            title: const Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

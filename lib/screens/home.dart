import 'package:flutter/material.dart';
import 'package:ucaa_datamgt/index.dart';
import 'package:ucaa_datamgt/widgets/custom_drawer.dart';
import 'package:ucaa_datamgt/widgets/data_tables.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.menu,
                          size: 25, color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: const Text.rich(
                TextSpan(
                  text: 'Hello,\n',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Mr. Hillary ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const DataTableView(tableHeader: 'CaR Data'),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}

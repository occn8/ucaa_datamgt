import 'package:ucaa_datamgt/index.dart';

class DataView extends StatelessWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            DataTableView(
              tableHeader: 'WID Data',
              datasrc: WIDDataScr(),
              datacolumns: kWIDDataColumns,
            ),
          ],
        ),
      ),
    );
  }
}

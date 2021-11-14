import 'package:ucaa_datamgt/index.dart';

class DataView extends StatelessWidget {
  const DataView(
      {Key? key,
      required this.tableHeader,
      required this.datacolumns,
      required this.datasrc})
      : super(key: key);
  final String tableHeader;
  final List<DataColumn> datacolumns;
  final DataTableSource datasrc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.arrow_back,
                          size: 28, color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
                const Text(
                  'Data Table',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10)
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(50),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            DataTableView(
              tableHeader: tableHeader,
              datasrc: datasrc,
              datacolumns: datacolumns,
            ),
          ],
        ),
      ),
    );
  }
}

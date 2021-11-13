import 'package:ucaa_datamgt/index.dart';

class DataTableView extends StatefulWidget {
  const DataTableView(
      {Key? key,
      required this.tableHeader,
      required this.datacolumns,
      required this.datasrc})
      : super(key: key);
  final String tableHeader;
  final List<DataColumn> datacolumns;
  final DataTableSource datasrc;

  @override
  _DataTableViewState createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text(widget.tableHeader),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const <int>[5, 10, 20],
        onRowsPerPageChanged: (int? value) {
          if (value != null) {
            setState(() => _rowsPerPage = value);
          }
        },
        columns: widget.datacolumns,
        source: widget.datasrc,
      ),
    );
  }
}

import 'package:ucaa_datamgt/index.dart';

const kREACHDataColumns = <DataColumn>[
  DataColumn(label: Text('VSLA-Name')),
  DataColumn(label: Text('Attendance')),
  DataColumn(label: Text('location')),
  DataColumn(label: Text('Members')),
  DataColumn(label: Text('Total-savings')),
  DataColumn(label: Text('VSLA-Capital')),
  DataColumn(label: Text('Loan-taken')),
  DataColumn(label: Text('Total-welfare')),
  DataColumn(label: Text('Welfare-Loaned')),
  DataColumn(label: Text('Members-loaned')),
  DataColumn(label: Text('loan-repay')),
];

final List<REACHdataModel> _reachDataRows = <REACHdataModel>[
  REACHdataModel('vslaName', 23, 'location', 19, 1000, 8000, 2990, 1000, 200, 5,
      200, '1/3/2021', '4/6/2020'),
  REACHdataModel('vslaName', 23, 'location', 19, 1000, 8000, 2990, 1000, 200, 5,
      200, '1/3/2021', '4/6/2020'),
  REACHdataModel('vslaName', 23, 'location', 19, 1000, 8000, 2990, 1000, 200, 5,
      200, '1/3/2021', '4/6/2020'),
  REACHdataModel('vslaName', 23, 'location', 19, 1000, 8000, 2990, 1000, 200, 5,
      200, '1/3/2021', '4/6/2020'),
  REACHdataModel('vslaName', 23, 'location', 19, 1000, 8000, 2990, 1000, 200, 5,
      200, '1/3/2021', '4/6/2020'),
];

class REACHDataScr extends DataTableSource {
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _reachDataRows.length) return null;
    final REACHdataModel reachdata = _reachDataRows[index];
    return DataRow.byIndex(
      index: index,
      selected: reachdata.selected,
      onSelectChanged: (bool? val) {
        if (val == null) return;
        if (reachdata.selected != val) {
          _selectedCount += val ? 1 : -1;
          assert(_selectedCount >= 0);
          reachdata.selected = val;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text(reachdata.vslaName)),
        DataCell(Text(reachdata.perAttendence.toString())),
        DataCell(Text(reachdata.location)),
        DataCell(Text(reachdata.numMembers.toString())),
        DataCell(Text(reachdata.totalSavings.toString())),
        DataCell(Text(reachdata.vslaCapital.toString())),
        DataCell(Text(reachdata.loanTaken.toString())),
        DataCell(Text(reachdata.totalWelfare.toString())),
        DataCell(Text(reachdata.welfareLoanedOut.toString())),
        DataCell(Text(reachdata.membersAccessedLoans.toString())),
        DataCell(Text(reachdata.loanRepayment.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _reachDataRows.length;

  @override
  int get selectedRowCount => _selectedCount;
}

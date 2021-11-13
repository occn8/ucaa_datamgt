import 'package:ucaa_datamgt/index.dart';

const kWIDDataColumns = <DataColumn>[
  DataColumn(label: Text('Group-Name')),
  DataColumn(label: Text('SubCounty')),
  DataColumn(label: Text('Parish')),
  DataColumn(label: Text('Formed')),
  DataColumn(label: Text('Members')),
  DataColumn(label: Text('Times-shared')),
  DataColumn(label: Text('shareValue')),
  DataColumn(label: Text('Children')),
  DataColumn(label: Text('Highest-saver')),
  DataColumn(label: Text('Savings')),
  DataColumn(label: Text('Social-fund')),
  DataColumn(label: Text('Loans-taken')),
  DataColumn(label: Text('Loans-accessed')),
  DataColumn(label: Text('loan-repay')),
  DataColumn(label: Text('loans-off')),
];

final List<WIDdataModel> _widDataRows = <WIDdataModel>[
  WIDdataModel('groupName', 'subCounty', 'parish', '1/5/633', 90, 3, 1000, 7,
      3000, 20000, 1000, 1000, 4, 9, 2000),
  WIDdataModel('groupName', 'subCounty', 'parish', '1/5/633', 90, 3, 1000, 7,
      3000, 20000, 1000, 1000, 4, 9, 2000),
  WIDdataModel('groupName', 'subCounty', 'parish', '1/5/633', 90, 3, 1000, 7,
      3000, 20000, 1000, 1000, 4, 9, 2000),
  WIDdataModel('groupName', 'subCounty', 'parish', '1/5/633', 90, 3, 1000, 7,
      3000, 20000, 1000, 1000, 4, 9, 2000),
  WIDdataModel('groupName', 'subCounty', 'parish', '1/5/633', 90, 3, 1000, 7,
      3000, 20000, 1000, 1000, 4, 9, 2000),
  WIDdataModel('groupName', 'subCounty', 'parish', '1/5/633', 90, 3, 1000, 7,
      3000, 20000, 1000, 1000, 4, 9, 2000),
];

class WIDDataScr extends DataTableSource {
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _widDataRows.length) return null;
    final WIDdataModel widdata = _widDataRows[index];
    return DataRow.byIndex(
      index: index,
      selected: widdata.selected,
      onSelectChanged: (bool? val) {
        if (val == null) return;
        if (widdata.selected != val) {
          _selectedCount += val ? 1 : -1;
          assert(_selectedCount >= 0);
          widdata.selected = val;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text(widdata.groupName)),
        DataCell(Text(widdata.subCounty)),
        DataCell(Text(widdata.parish)),
        DataCell(Text(widdata.gdFormed)),
        DataCell(Text(widdata.numMembers.toString())),
        DataCell(Text(widdata.timesSharedOut.toString())),
        DataCell(Text(widdata.shareValue.toString())),
        DataCell(Text(widdata.numChildren.toString())),
        DataCell(Text(widdata.amntHighestSaver.toString())),
        DataCell(Text(widdata.amntSaved.toString())),
        DataCell(Text(widdata.amntSocialFund.toString())),
        DataCell(Text(widdata.amntLoansTaken.toString())),
        DataCell(Text(widdata.numLoansAccessed.toString())),
        DataCell(Text(widdata.loanRepayment.toString())),
        DataCell(Text(widdata.amntLoansWrittenoff.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _widDataRows.length;

  @override
  int get selectedRowCount => _selectedCount;
}

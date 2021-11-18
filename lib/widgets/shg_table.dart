import 'package:ucaa_datamgt/index.dart';

const kSHGDataColumns = <DataColumn>[
  DataColumn(label: Text('SHG-Name')),
  DataColumn(label: Text('Location')),
  DataColumn(label: Text('Formed')),
  DataColumn(label: Text('Members')),
  DataColumn(label: Text('Attendance/Wk')),
  DataColumn(label: Text('Children')),
  DataColumn(label: Text('Wk-Savings')),
  DataColumn(label: Text('Wk-Savings/member')),
  DataColumn(label: Text('Total-saving')),
  DataColumn(label: Text('SHG-funds')),
  DataColumn(label: Text('Loan-taken')),
  DataColumn(label: Text('Loans-Accessed')),
  DataColumn(label: Text('Loan-repay')),
  DataColumn(label: Text('Loans.Saving Ratio')),
];

final List<SHGdataModel> shgDataRows = <SHGdataModel>[];

class SHGDataScr extends DataTableSource {
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= shgDataRows.length) return null;
    final SHGdataModel shgdata = shgDataRows[index];
    return DataRow.byIndex(
      index: index,
      selected: shgdata.selected,
      onSelectChanged: (bool? val) {
        if (val == null) return;
        if (shgdata.selected != val) {
          _selectedCount += val ? 1 : -1;
          assert(_selectedCount >= 0);
          shgdata.selected = val;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text(shgdata.shgName)),
        DataCell(Text(shgdata.location)),
        DataCell(Text(shgdata.shgFormed)),
        DataCell(Text(shgdata.numMember.toString())),
        DataCell(Text(shgdata.perAttendanceWk.toString())),
        DataCell(Text(shgdata.numChildren.toString())),
        DataCell(Text(shgdata.wkSavings.toString())),
        DataCell(Text(shgdata.wkSavingPerMember.toString())),
        DataCell(Text(shgdata.totalSaving.toString())),
        DataCell(Text(shgdata.shgFunds.toString())),
        DataCell(Text(shgdata.amountLoanTaken.toString())),
        DataCell(Text(shgdata.numLoansAccessed.toString())),
        DataCell(Text(shgdata.loanRepayment.toString())),
        DataCell(Text(shgdata.loanSavingRatio)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => shgDataRows.length;

  @override
  int get selectedRowCount => _selectedCount;
}

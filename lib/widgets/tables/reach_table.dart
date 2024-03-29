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
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<REACHdataModel> reachDataRows = <REACHdataModel>[];

class REACHDataScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= reachDataRows.length) return null;
    final REACHdataModel reachdata = reachDataRows[index];
    return DataRow.byIndex(
      index: index,
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
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddReach(dataId: reachdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(
                    docId: reachdata.id, col: 'reachtable');
              })
            : const DataCell(Text('')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => reachDataRows.length;

  @override
  int get selectedRowCount => 0;
}

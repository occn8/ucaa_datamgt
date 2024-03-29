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
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<SHGdataModel> shgDataRows = <SHGdataModel>[];

class SHGDataScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= shgDataRows.length) return null;
    final SHGdataModel shgdata = shgDataRows[index];
    return DataRow.byIndex(
      index: index,
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
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddShg(dataId: shgdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(docId: shgdata.id, col: 'shgtable');
              })
            : const DataCell(Text('')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => shgDataRows.length;

  @override
  int get selectedRowCount => 0;
}

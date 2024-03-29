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
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<WIDdataModel> widDataRows = <WIDdataModel>[];

class WIDDataScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= widDataRows.length) return null;
    final WIDdataModel widdata = widDataRows[index];
    return DataRow.byIndex(
      index: index,
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
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddWid(dataId: widdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(docId: widdata.id, col: 'widtable');
              })
            : const DataCell(Text('')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => widDataRows.length;

  @override
  int get selectedRowCount => 0;
}

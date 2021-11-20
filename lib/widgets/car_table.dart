import 'package:ucaa_datamgt/index.dart';

const kCaRDataColumns = <DataColumn>[
  DataColumn(label: Text('Group-Name')),
  DataColumn(label: Text('SubCounty')),
  DataColumn(label: Text('Parish')),
  DataColumn(label: Text('Formed')),
  DataColumn(label: Text('Members')),
  DataColumn(label: Text('Male')),
  DataColumn(label: Text('Female')),
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

List<CaRDataModel> carDataRows = <CaRDataModel>[];
// List selecteddata = [];

class CaRDataScr extends DataTableSource {
  // int _selectedCount = 0;
// deleteSelected() async {
//     setState(() {
//       if (selecteddata.isNotEmpty) {
//         List temp = [];
//         temp.addAll(selecteddata);
//         for (var data in temp) {
//           carDataRows.remove(data);
//           selecteddata.remove(data);
//           CloudDatabase.deleteData(docId: data.id);
//         }
//       }
//     });
//   }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= carDataRows.length) return null;
    final CaRDataModel cardata = carDataRows[index];
    return DataRow.byIndex(
      index: index,
      // selected: cardata.selected,
      // onSelectChanged: (bool? val) {
      //   if (val == null) return;
      //   if (cardata.selected != val) {
      //     _selectedCount += val ? 1 : -1;
      //     assert(_selectedCount >= 0);
      //     cardata.selected = val;
      //     selecteddata.add(cardata);
      //     notifyListeners();
      //   }
      // },
      cells: <DataCell>[
        DataCell(Text(cardata.groupName)),
        DataCell(Text(cardata.subCounty)),
        DataCell(Text(cardata.parish)),
        DataCell(Text(cardata.gdFormed)),
        DataCell(Text(cardata.numMembers.toString())),
        DataCell(Text(cardata.segMale.toString())),
        DataCell(Text(cardata.segFemale.toString())),
        DataCell(Text(cardata.timesSharedOut.toString())),
        DataCell(Text(cardata.shareValue.toString())),
        DataCell(Text(cardata.numChildren.toString())),
        DataCell(Text(cardata.amntHighestSaver.toString())),
        DataCell(Text(cardata.amntSaved.toString())),
        DataCell(Text(cardata.amntSocialFund.toString())),
        DataCell(Text(cardata.amntLoansTaken.toString())),
        DataCell(Text(cardata.numLoansAccessed.toString())),
        DataCell(Text(cardata.loanRepayment.toString())),
        DataCell(Text(cardata.amntLoansWrittenoff.toString())),
        DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {}),
        DataCell(const Icon(Icons.delete, color: Colors.redAccent), onTap: () {
          CloudDatabase.deleteData(docId: cardata.id);
        }),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => carDataRows.length;

  @override
  int get selectedRowCount => 0;
}

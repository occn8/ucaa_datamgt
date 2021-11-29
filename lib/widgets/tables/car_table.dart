import 'package:ucaa_datamgt/index.dart';

const TextStyle styl = TextStyle(
    color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16.5);

const kCaRDataColumns = <DataColumn>[
  DataColumn(label: Text('Group-Name', style: styl)),
  DataColumn(label: Text('SubCounty', style: styl)),
  DataColumn(label: Text('Parish', style: styl)),
  DataColumn(label: Text('Formed', style: styl)),
  DataColumn(label: Text('Members', style: styl)),
  DataColumn(label: Text('Male', style: styl)),
  DataColumn(label: Text('Female', style: styl)),
  DataColumn(label: Text('Times-shared', style: styl)),
  DataColumn(label: Text('shareValue', style: styl)),
  DataColumn(label: Text('Children', style: styl)),
  DataColumn(label: Text('Highest-saver', style: styl)),
  DataColumn(label: Text('Savings', style: styl)),
  DataColumn(label: Text('Social-fund', style: styl)),
  DataColumn(label: Text('Loans-taken', style: styl)),
  DataColumn(label: Text('Loans-accessed', style: styl)),
  DataColumn(label: Text('loan-repay', style: styl)),
  DataColumn(label: Text('loans-off', style: styl)),
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
      color:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        cardata.created.contains('2021-11-');
        return Colors.amber.withOpacity(0.08);
      }),
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
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddCaR(dataId: cardata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(docId: cardata.id, col: 'cartable');
              })
            : const DataCell(Text('')),
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

import 'package:ucaa_datamgt/index.dart';

class CaRDataModel {
  final String groupName;
  final String subCounty;
  final String parish;
  final String gdFormed;
  final int numMembers;
  final int segMale;
  final int segFemale;
  final int timesSharedOut;
  final double shareValue;
  final int numChildren;
  final double amntHighestSaver;
  final double amntSaved;
  final double amntSocialFund;
  final double amntLoansTaken;
  final int numLoansAccessed;
  final num loanRepayment;
  final double amntLoansWrittenoff;
  bool selected = false;

  CaRDataModel(
    this.groupName,
    this.subCounty,
    this.parish,
    this.gdFormed,
    this.numMembers,
    this.segMale,
    this.segFemale,
    this.timesSharedOut,
    this.shareValue,
    this.numChildren,
    this.amntHighestSaver,
    this.amntSaved,
    this.amntSocialFund,
    this.amntLoansTaken,
    this.numLoansAccessed,
    this.loanRepayment,
    this.amntLoansWrittenoff,
  );
}

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
];

final List<CaRDataModel> _carDataRows = <CaRDataModel>[
  CaRDataModel('groupName', 'subCounty', 'parish', '1/12/1', 10, 5, 5, 0, 100,
      0, 0, 1000, 10000, 1000, 2, 0, 1000),
  CaRDataModel('groupName', 'subCounty', 'parish', '1/12/1', 10, 5, 5, 0, 100,
      0, 0, 1000, 10000, 1000, 2, 0, 1000),
  CaRDataModel('groupName', 'subCounty', 'parish', '1/12/1', 10, 5, 5, 0, 100,
      0, 0, 1000, 10000, 1000, 2, 0, 1000),
  CaRDataModel('groupName', 'subCounty', 'parish', '1/12/1', 10, 5, 5, 0, 100,
      0, 0, 1000, 10000, 1000, 2, 0, 1000),
];

class CaRDataScr extends DataTableSource {
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _carDataRows.length) return null;
    final CaRDataModel cardata = _carDataRows[index];
    return DataRow.byIndex(
      index: index,
      selected: cardata.selected,
      onSelectChanged: (bool? val) {
        if (val == null) return;
        if (cardata.selected != val) {
          _selectedCount += val ? 1 : -1;
          assert(_selectedCount >= 0);
          cardata.selected = val;
          notifyListeners();
        }
      },
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
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _carDataRows.length;

  @override
  int get selectedRowCount => _selectedCount;
}

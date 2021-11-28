import 'package:ucaa_datamgt/index.dart';

const kMonitorDataColumns = <DataColumn>[
  DataColumn(label: Text('Name of Collector')),
  DataColumn(label: Text('Title')),
  DataColumn(label: Text('Group Name')),
  DataColumn(label: Text('Total Members')),
  DataColumn(label: Text('Male')),
  DataColumn(label: Text('Female')),
  DataColumn(label: Text('Sub-County')),
  DataColumn(label: Text('Parish')),
  DataColumn(label: Text('Village')),
  DataColumn(label: Text('Reporting Quarter')),
  DataColumn(label: Text('Month')),
  DataColumn(label: Text('Total Savings')),
  DataColumn(label: Text('Loan amount given out')),
  DataColumn(label: Text('Loan repayment amount')),
  DataColumn(label: Text('Total Social fund')),
  DataColumn(label: Text('Members with IGAs')),
  DataColumn(label: Text('Members who started IGAs')),
  DataColumn(label: Text('Members-IGAs collapsed')),
  DataColumn(label: Text('Members-IGAs maitained')),
  DataColumn(label: Text('Any IGAs')),
  DataColumn(label: Text('Summary-achievements')),
  DataColumn(label: Text('Challenges')),
  DataColumn(label: Text('solutions')),
  DataColumn(label: Text('Action Plan')),
  DataColumn(label: Text('Remarks')),
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<MonitorToolModel> monitoringDataRows = <MonitorToolModel>[];

class MonitorDataScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= monitoringDataRows.length) return null;
    final MonitorToolModel monitoringdata = monitoringDataRows[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(monitoringdata.collectorName)),
        DataCell(Text(monitoringdata.title)),
        DataCell(Text(monitoringdata.grpName)),
        DataCell(Text(monitoringdata.numMembers.toString())),
        DataCell(Text(monitoringdata.numMale.toString())),
        DataCell(Text(monitoringdata.numFemale.toString())),
        DataCell(Text(monitoringdata.subCounty)),
        DataCell(Text(monitoringdata.parish)),
        DataCell(Text(monitoringdata.village)),
        DataCell(Text(monitoringdata.reportQuarter)),
        DataCell(Text(monitoringdata.month)),
        DataCell(Text(monitoringdata.totalSavings.toString())),
        DataCell(Text(monitoringdata.loanAmtGivenOut.toString())),
        DataCell(Text(monitoringdata.loanRepaymentAmt.toString())),
        DataCell(Text(monitoringdata.totalSocialFund.toString())),
        DataCell(Text(monitoringdata.numMemeberWithIGA.toString())),
        DataCell(Text(monitoringdata.numMembersNewIGA.toString())),
        DataCell(Text(monitoringdata.numMembersIGAcollapsed.toString())),
        DataCell(Text(monitoringdata.numMembersIGAmaitained.toString())),
        DataCell(Text(monitoringdata.anyIGAyesORno)),
        DataCell(Text(monitoringdata.summaryOFArchievements)),
        DataCell(Text(monitoringdata.challenges)),
        DataCell(Text(monitoringdata.solutions)),
        DataCell(Text(monitoringdata.grpActionPlan)),
        DataCell(Text(monitoringdata.remarks)),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddMonitoring(dataId: monitoringdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(
                    docId: monitoringdata.id, col: 'monitortable');
              })
            : const DataCell(Text('')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => monitoringDataRows.length;

  @override
  int get selectedRowCount => 0;
}

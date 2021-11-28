import 'package:ucaa_datamgt/index.dart';

const kIndDevColumns = <DataColumn>[
  DataColumn(label: Text('Planning date')),
  DataColumn(label: Text('Name')),
  DataColumn(label: Text('Group Name')),
  DataColumn(label: Text('District')),
  DataColumn(label: Text('Sub-County')),
  DataColumn(label: Text('Parish')),
  DataColumn(label: Text('Village')),
  DataColumn(label: Text('Needs')),
  DataColumn(label: Text('Actions to be taken')),
  DataColumn(label: Text('Name of Staff')),
  DataColumn(label: Text('Date')),
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<IndDevPlanModel> indDevDataRows = <IndDevPlanModel>[];

class IndDevScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= indDevDataRows.length) return null;
    final IndDevPlanModel indDevdata = indDevDataRows[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(indDevdata.dataMakingPlan)),
        DataCell(Text(indDevdata.name)),
        DataCell(Text(indDevdata.grpName)),
        DataCell(Text(indDevdata.district)),
        DataCell(Text(indDevdata.subCounty)),
        DataCell(Text(indDevdata.parish)),
        DataCell(Text(indDevdata.village)),
        DataCell(Text(indDevdata.needs)),
        DataCell(Text(indDevdata.actionsTaken)),
        DataCell(Text(indDevdata.staff)),
        DataCell(Text(indDevdata.date)),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddDevPlan(dataId: indDevdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(
                    docId: indDevdata.id, col: 'devplantable');
              })
            : const DataCell(Text('')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => indDevDataRows.length;

  @override
  int get selectedRowCount => 0;
}

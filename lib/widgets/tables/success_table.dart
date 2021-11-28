import 'package:ucaa_datamgt/index.dart';

const kSuccessColumns = <DataColumn>[
  DataColumn(label: Text('Name')),
  DataColumn(label: Text('Marital-Status')),
  DataColumn(label: Text('Number of Children')),
  DataColumn(label: Text('Date')),
  DataColumn(label: Text('Sex')),
  DataColumn(label: Text('Age')),
  DataColumn(label: Text('District')),
  DataColumn(label: Text('Sub-county')),
  DataColumn(label: Text('Parish')),
  DataColumn(label: Text('Village')),
  DataColumn(label: Text('Group Name')),
  DataColumn(label: Text('Year of encounter')),
  DataColumn(label: Text('Life before')),
  DataColumn(label: Text('Capacity building')),
  DataColumn(label: Text('Changes compared to before')),
  DataColumn(label: Text('Other influences')),
  DataColumn(label: Text('Future Plan')),
  DataColumn(label: Text('Other comments')),
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<SuccessStoryModel> successDataRows = <SuccessStoryModel>[];

class SuccessScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= successDataRows.length) return null;
    final SuccessStoryModel successdata = successDataRows[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(successdata.name)),
        DataCell(Text(successdata.maritalStatus)),
        DataCell(Text(successdata.numChildren.toString())),
        DataCell(Text(successdata.date)),
        DataCell(Text(successdata.sex)),
        DataCell(Text(successdata.age.toString())),
        DataCell(Text(successdata.district)),
        DataCell(Text(successdata.subCounty)),
        DataCell(Text(successdata.parish)),
        DataCell(Text(successdata.village)),
        DataCell(Text(successdata.groupName)),
        DataCell(Text(successdata.yrOfEncounterAndHow)),
        DataCell(Text(successdata.lifeBeforeEncounter)),
        DataCell(Text(successdata.capacityBuilding)),
        DataCell(Text(successdata.changesInLifeComparedToBefore)),
        DataCell(Text(successdata.otherInfluencesThatChangedLife)),
        DataCell(Text(successdata.futurePlan)),
        DataCell(Text(successdata.otherComments)),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddSuccess(dataId: successdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(
                    docId: successdata.id, col: 'successstory');
              })
            : const DataCell(Text('')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => successDataRows.length;

  @override
  int get selectedRowCount => 0;
}

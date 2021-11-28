import 'package:ucaa_datamgt/index.dart';

const kStaffTDataColumns = <DataColumn>[
  DataColumn(label: Text('Project')),
  DataColumn(label: Text('Area of Operation')),
  DataColumn(label: Text('Name of staff')),
  DataColumn(label: Text('Title')),
  DataColumn(label: Text('Month')),
  DataColumn(label: Text('Year')),
  DataColumn(label: Text('Name of Group')),
  DataColumn(label: Text('Lessons learnt')),
  DataColumn(label: Text('Challenges faced')),
  DataColumn(label: Text('Possible solutions')),
  DataColumn(label: Text('Date')),
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<StaffGrpTrackToolModel> stafftrackDataRows =
    <StaffGrpTrackToolModel>[];

class StaffTrackDataScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= stafftrackDataRows.length) return null;
    final StaffGrpTrackToolModel stafftdata = stafftrackDataRows[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(stafftdata.project)),
        DataCell(Text(stafftdata.areaOfOp)),
        DataCell(Text(stafftdata.staffName)),
        DataCell(Text(stafftdata.title)),
        DataCell(Text(stafftdata.monthUnderReview)),
        DataCell(Text(stafftdata.year)),
        DataCell(Text(stafftdata.grpName)),
        DataCell(Text(stafftdata.lessonsLearnt)),
        DataCell(Text(stafftdata.challengesFaced)),
        DataCell(Text(stafftdata.possibleSolution)),
        DataCell(Text(stafftdata.date)),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddStaffTrack(dataId: stafftdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(
                    docId: stafftdata.id, col: 'stafftracktable');
              })
            : const DataCell(Text('')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => stafftrackDataRows.length;

  @override
  int get selectedRowCount => 0;
}

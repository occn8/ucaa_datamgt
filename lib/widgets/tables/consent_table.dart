import 'package:ucaa_datamgt/index.dart';

const kConsentDataColumns = <DataColumn>[
  DataColumn(label: Text('Name')),
  DataColumn(label: Text('Name of parent(below 18)')),
  DataColumn(label: Text('Phone')),
  DataColumn(label: Text('Approval')),
  DataColumn(label: Text('Date')),
  DataColumn(label: Text('created')),
  DataColumn(label: Text('')),
  DataColumn(label: Text('')),
];

final List<ConsentModel> consentRows = <ConsentModel>[];

class ConsentScr extends DataTableSource {
  // int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= consentRows.length) return null;
    final ConsentModel consentdata = consentRows[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(consentdata.name)),
        DataCell(Text(consentdata.nameParent)),
        DataCell(Text(consentdata.phone)),
        DataCell(Text(consentdata.approval)),
        DataCell(Text(consentdata.date)),
        DataCell(Text(consentdata.created)),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.edit, color: Colors.green), onTap: () {
                Get.to(() => AddConsent(dataId: consentdata.id));
              })
            : const DataCell(Text('')),
        (usrrole == 'Admin' || usrrole == 'Editor')
            ? DataCell(const Icon(Icons.delete, color: Colors.redAccent),
                onTap: () {
                CloudDatabase.deleteData(
                    docId: consentdata.id, col: 'consenttable');
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

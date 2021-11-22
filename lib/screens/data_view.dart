import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

class DataView extends StatefulWidget {
  const DataView({
    Key? key,
    required this.tableHeader,
  }) : super(key: key);
  final String tableHeader;

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.arrow_back,
                          size: 28, color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
                Text(
                  '${widget.tableHeader} Data Table',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10)
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(50),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(widget.tableHeader == 'CaR'
                            ? 'cartable'
                            : widget.tableHeader == 'REACH'
                                ? 'reachtable'
                                : widget.tableHeader == 'SHG'
                                    ? 'shgtable'
                                    : 'widtable')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: const [
                            LinearProgressIndicator(),
                          ],
                        );
                      }
                      if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            color: Theme.of(context).backgroundColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(height: 10),
                                Text(
                                  'No Data here!',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ));
                      }
                      int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

                      // List docs = snapshot.data!.docs;
                      // var cmodel = CaRDataModel('', '', '', '', '', 0, 0, 0, 0,
                      //     0, 0, 0, 0, 0, 0, 0, 0, 0, 'created', 'modified');
                      // carDataRows.clear();
                      // for (var doc in docs) {
                      //   cmodel.fromMap(
                      //       doc.id, doc.data()! as Map<String, dynamic>);
                      //   carDataRows.add(cmodel);
                      //   print(doc.id);
                      // }
                      return SingleChildScrollView(
                        child: PaginatedDataTable(
                          header: Text(
                            widget.tableHeader,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w800),
                          ),
                          rowsPerPage: _rowsPerPage,
                          availableRowsPerPage: const <int>[5, 10, 20],
                          onRowsPerPageChanged: (int? value) {
                            if (value != null) {
                              setState(() => _rowsPerPage = value);
                            }
                          },
                          columns: widget.tableHeader == 'CaR'
                              ? kCaRDataColumns
                              : widget.tableHeader == 'REACH'
                                  ? kREACHDataColumns
                                  : widget.tableHeader == 'SHG'
                                      ? kSHGDataColumns
                                      : kWIDDataColumns,
                          source: widget.tableHeader == 'CaR'
                              ? CaRDataScr()
                              : widget.tableHeader == 'REACH'
                                  ? REACHDataScr()
                                  : widget.tableHeader == 'SHG'
                                      ? SHGDataScr()
                                      : WIDDataScr(),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

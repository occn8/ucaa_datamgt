import 'package:ucaa_datamgt/index.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // Row(
              //   children: [
              //     Builder(
              //       builder: (context) => InkWell(
              //         splashColor: Theme.of(context).colorScheme.secondary,
              //         borderRadius: BorderRadius.circular(10),
              //         onTap: () => Scaffold.of(context).openDrawer(),
              //         child: Container(
              //           margin: const EdgeInsets.symmetric(horizontal: 5),
              //           padding: const EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Icon(Icons.menu,
              //               size: 25,
              //               color: Theme.of(context).primaryColorDark),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: const Text('UCAA',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 100, bottom: 20),
                color: Colors.green,
                height: 1,
                width: 150,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: const Text.rich(
                  TextSpan(
                    text: 'Hello,\n',
                    style: TextStyle(fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Mr. Hillary ',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              tableLinks(context, 'CaR Group Data', 69, () {
                Get.to(() => DataView(
                      tableHeader: 'CaR Group Data',
                      datacolumns: kCaRDataColumns,
                      datasrc: CaRDataScr(),
                    ));
              }),
              tableLinks(context, 'REACH Data for Groups', 40, () {
                Get.to(() => DataView(
                      tableHeader: 'REACH Data for Groups',
                      datacolumns: kREACHDataColumns,
                      datasrc: REACHDataScr(),
                    ));
              }),
              tableLinks(context, 'SHG Data Collected', 11, () {
                Get.to(() => DataView(
                      tableHeader: 'SHG Data Collected',
                      datacolumns: kSHGDataColumns,
                      datasrc: SHGDataScr(),
                    ));
              }),
              tableLinks(context, 'WID Data', 619, () {
                Get.to(() => DataView(
                      tableHeader: 'WID Data',
                      datacolumns: kWIDDataColumns,
                      datasrc: WIDDataScr(),
                    ));
              }),
            ],
          ),
        ),
      ),
      // drawer: const CustomDrawer(),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.list_view,
          overlayColor: Colors.white,
          overlayOpacity: 0.7,
          spacing: 15,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.people),
              label: 'Add Users',
              onTap: () {
                Get.to(() => const AddUser());
              },
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add data',
              onTap: () {
                Get.to(() => const AddData());
              },
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
          ]),

      // FloatingActionButton.extended(
      //   onPressed: () {
      //     Get.to(() => const AddData());
      //   },
      //   icon: const Icon(Icons.add),
      //   label: const Text('Add data'),
      // ),
    );
  }

  Container tableLinks(
      BuildContext context, String name, int length, VoidCallback ontap) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'total entries: $length',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  )),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 30,
                  child: Column(
                    children: [
                      ...[1, 2, 3, 4, 5, 6].map(
                        (e) => Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1, color: Colors.green)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  color: Colors.green,
                  height: 1,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

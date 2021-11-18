import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/auth_status.dart';
import 'package:ucaa_datamgt/index.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getDocs();
  }

  Future getDocs() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("cartable").get();
    List docs = querySnapshot.docs;
    var cmodel = CaRDataModel(
        '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');
    carDataRows.clear();
    for (var doc in docs) {
      cmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
      carDataRows.add(cmodel);
    }
    QuerySnapshot querySnapshot2 =
        await FirebaseFirestore.instance.collection("reachtable").get();
    List docs2 = querySnapshot2.docs;
    var rmodel = REACHdataModel('', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '');
    reachDataRows.clear();
    for (var doc in docs2) {
      rmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
      reachDataRows.add(rmodel);
    }
    QuerySnapshot querySnapshot3 =
        await FirebaseFirestore.instance.collection("shgtable").get();
    List docs3 = querySnapshot3.docs;
    var smodel =
        SHGdataModel('', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '');
    shgDataRows.clear();
    for (var doc in docs3) {
      smodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
      shgDataRows.add(smodel);
    }
    QuerySnapshot querySnapshot4 =
        await FirebaseFirestore.instance.collection("widtable").get();
    List docs4 = querySnapshot4.docs;
    var wmodel =
        WIDdataModel('', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');
    widDataRows.clear();
    for (var doc in docs4) {
      wmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
      widDataRows.add(wmodel);
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle dialstyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: const Text('UCAA',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Row(
                            children: const [
                              Icon(Icons.brightness_4),
                              SizedBox(width: 4),
                              Text('Dark Theme'),
                            ],
                          ),
                          padding: const EdgeInsets.all(15),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: const [
                              Icon(Icons.logout),
                              SizedBox(width: 4),
                              Text('LogOut'),
                            ],
                          ),
                          onTap: () async {
                            Get.off(() => const AuthStatus());
                            await AuthenticationHelper().signOut();
                          },
                          padding: const EdgeInsets.all(15),
                        )
                      ];
                    },
                  )
                ],
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
              tableLinks(context, 'CaR Group Data', carDataRows.length, () {
                Get.to(() => const DataView(tableHeader: 'CaR'));
              }),
              tableLinks(context, 'REACH Data for Groups', reachDataRows.length,
                  () {
                Get.to(() => const DataView(tableHeader: 'REACH'));
              }),
              tableLinks(context, 'SHG Data Collected', shgDataRows.length, () {
                Get.to(() => const DataView(tableHeader: 'SHG'));
              }),
              tableLinks(context, 'WID Data', widDataRows.length, () {
                Get.to(() => const DataView(tableHeader: 'WID'));
              }),
            ],
          ),
        ),
      ),
      // drawer: const CustomDrawer(),
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.list_view,
          overlayColor: Colors.white,
          overlayOpacity: 0.8,
          spacing: 15,
          childrenButtonSize: 60,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.people),
              label: 'Add Users',
              labelStyle: dialstyle,
              onTap: () {
                Get.to(() => const AddUser());
              },
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add CaR data',
              labelStyle: dialstyle,
              onTap: () {
                Get.to(() => const AddCaR(dataId: ''));
              },
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add Reach data',
              labelStyle: dialstyle,
              onTap: () {
                Get.to(() => const AddReach(dataId: ''));
              },
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add SHG data',
              labelStyle: dialstyle,
              onTap: () {
                Get.to(() => const AddShg(dataId: ''));
              },
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
            SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Add WID data',
              labelStyle: dialstyle,
              onTap: () {
                Get.to(() => const AddWid(dataId: ''));
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ucaa_datamgt/index.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

const String ucaa = 'Uganda Change Agent Association';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    getDocs().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<ThemeModel>(context);
    const TextStyle dialstyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).backgroundColor,
        statusBarBrightness: Theme.of(context).brightness,
        statusBarIconBrightness: Theme.of(context).brightness,
        systemNavigationBarColor: Theme.of(context).backgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
        systemNavigationBarDividerColor: Theme.of(context).backgroundColor,
      ),
      child: Scaffold(
        body: SafeArea(
          child: RespWidget(
            largeScreen: largeScreen(appModel),
            smallScreen: smallScreen(appModel),
          ),
        ),
        // drawer: const CustomDrawer(),
        floatingActionButton: (usrrole == 'Admin' || usrrole == 'Editor')
            ? SpeedDial(
                animatedIcon: AnimatedIcons.list_view,
                overlayColor: Theme.of(context).backgroundColor,
                overlayOpacity: 0.8,
                spacing: 15,
                backgroundColor: Theme.of(context).primaryColor,
                childrenButtonSize: 60,
                children: [
                    usrrole == 'Admin'
                        ? SpeedDialChild(
                            child: const Icon(Icons.people),
                            label: 'Users',
                            labelBackgroundColor:
                                Theme.of(context).backgroundColor,
                            labelStyle: dialstyle,
                            onTap: () {
                              Get.to(() => const UserView());
                            },
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                          )
                        : SpeedDialChild(),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add Consent',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddConsent(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add Success Story',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddSuccess(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add Staff Tracking',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddStaffTrack(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add Monitoring Tool',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddMonitoring(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add Dev Plan',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddDevPlan(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add WID data',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddWid(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add SHG data',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddShg(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add Reach data',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddReach(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    SpeedDialChild(
                      child: const Icon(Icons.add),
                      label: 'Add CaR data',
                      labelBackgroundColor: Theme.of(context).backgroundColor,
                      labelStyle: dialstyle,
                      onTap: () {
                        Get.to(() => const AddCaR(dataId: ''));
                      },
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                  ])
            : null,
      ),
    );
  }

  Container largeScreen(ThemeModel appModel) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Row(
            children: [
              Container(
                width: 280,
                height: double.infinity,
                color: Colors.amber,
              ),
              Expanded(
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
                                  children: [
                                    Icon(
                                        appModel.darkTheme != true
                                            ? Icons.brightness_2
                                            : Icons.brightness_7,
                                        color: appModel.darkTheme != true
                                            ? Colors.black
                                            : Colors.white),
                                    const SizedBox(width: 4),
                                    Text(
                                      appModel.darkTheme != true
                                          ? 'Dark Theme'
                                          : 'Light Theme',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  appModel.darkTheme = !appModel.darkTheme;
                                  setState(() {});
                                },
                                padding: const EdgeInsets.all(15),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    const Icon(Icons.logout),
                                    const SizedBox(width: 4),
                                    Text(
                                      'LogOut',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  await AuthenticationHelper().signOut();
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('userRole', 'Viewer');
                                  Get.off(() => const AuthStatus());
                                },
                                padding: const EdgeInsets.all(15),
                              )
                            ];
                          },
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 100, bottom: 20),
                      color: Colors.green,
                      height: 1,
                      width: 150,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Text.rich(
                        TextSpan(
                          text: 'Hello,\n $usrrole',
                          style: const TextStyle(fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: user!.displayName,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    tableLinks(context, 'CaR Group Data', carDataRows.length,
                        () {
                      Get.to(() => const DataView(tableHeader: 'CaR'));
                    }),
                    tableLinks(
                        context, 'REACH Data for Groups', reachDataRows.length,
                        () {
                      Get.to(() => const DataView(tableHeader: 'REACH'));
                    }),
                    tableLinks(
                        context, 'SHG Data Collected', shgDataRows.length, () {
                      Get.to(() => const DataView(tableHeader: 'SHG'));
                    }),
                    tableLinks(context, 'WID Data', widDataRows.length, () {
                      Get.to(() => const DataView(tableHeader: 'WID'));
                    }),
                    tableLinks(context, 'UCAA Consent Data', 0, () {
                      Get.to(() => const DataView(tableHeader: 'Consent'));
                    }),
                    tableLinks(context, 'Individual Development Plan', 0, () {
                      Get.to(() => const DataView(tableHeader: 'IndDevPlan'));
                    }),
                    tableLinks(context, 'Monitoring Tool for Groups', 0, () {
                      Get.to(() => const DataView(tableHeader: 'MonitorTool'));
                    }),
                    tableLinks(context, 'Staff Group Tracking Tool', 0, () {
                      Get.to(() =>
                          const DataView(tableHeader: 'StaffGrpTrackTool'));
                    }),
                    tableLinks(context, 'Success Stories', 0, () {
                      Get.to(() => const DataView(tableHeader: 'SuccessStory'));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container smallScreen(ThemeModel appModel) {
    return Container(
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(
                                appModel.darkTheme != true
                                    ? Icons.brightness_2
                                    : Icons.brightness_7,
                                color: appModel.darkTheme != true
                                    ? Colors.black
                                    : Colors.white),
                            const SizedBox(width: 4),
                            Text(
                              appModel.darkTheme != true
                                  ? 'Dark Theme'
                                  : 'Light Theme',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        onTap: () {
                          appModel.darkTheme = !appModel.darkTheme;
                          setState(() {});
                        },
                        padding: const EdgeInsets.all(15),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            const Icon(Icons.logout),
                            const SizedBox(width: 4),
                            Text(
                              'LogOut',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        onTap: () async {
                          await AuthenticationHelper().signOut();
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('userRole', 'Viewer');
                          Get.off(() => const AuthStatus());
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
              child: Text.rich(
                TextSpan(
                  text: 'Hello,\n',
                  style: const TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: user!.displayName,
                        style: const TextStyle(
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
            tableLinks(context, 'UCAA Consent Data', 0, () {
              Get.to(() => const DataView(tableHeader: 'Consent'));
            }),
            tableLinks(context, 'Individual Development Plan', 0, () {
              Get.to(() => const DataView(tableHeader: 'IndDevPlan'));
            }),
            tableLinks(context, 'Monitoring Tool for Groups', 0, () {
              Get.to(() => const DataView(tableHeader: 'MonitorTool'));
            }),
            tableLinks(context, 'Staff Group Tracking Tool', 0, () {
              Get.to(() => const DataView(tableHeader: 'StaffGrpTrackTool'));
            }),
            tableLinks(context, 'Success Stories', 0, () {
              Get.to(() => const DataView(tableHeader: 'SuccessStory'));
            }),
          ],
        ),
      ),
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
          width: kIsWeb ? 400 : null,
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

Future getDocs() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("cartable").get();
  List docs = querySnapshot.docs;
  carDataRows.clear();
  for (var doc in docs) {
    var cmodel = CaRDataModel(
        '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');
    cmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    carDataRows.add(cmodel);
  }
  QuerySnapshot querySnapshot2 =
      await FirebaseFirestore.instance.collection("reachtable").get();
  List docs2 = querySnapshot2.docs;
  reachDataRows.clear();
  for (var doc in docs2) {
    var rmodel = REACHdataModel('', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', '');
    rmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    reachDataRows.add(rmodel);
  }
  QuerySnapshot querySnapshot3 =
      await FirebaseFirestore.instance.collection("shgtable").get();
  List docs3 = querySnapshot3.docs;
  shgDataRows.clear();
  for (var doc in docs3) {
    var smodel =
        SHGdataModel('', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '');
    smodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    shgDataRows.add(smodel);
  }
  QuerySnapshot querySnapshot4 =
      await FirebaseFirestore.instance.collection("widtable").get();
  List docs4 = querySnapshot4.docs;
  widDataRows.clear();
  for (var doc in docs4) {
    var wmodel = WIDdataModel(
        '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '');
    wmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    widDataRows.add(wmodel);
  }

  QuerySnapshot querySnapshot5 =
      await FirebaseFirestore.instance.collection("consenttable").get();
  List docs5 = querySnapshot5.docs;
  consentRows.clear();
  for (var doc in docs5) {
    var comodel = ConsentModel('', '', '', '', '', '', '', '');
    comodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    consentRows.add(comodel);
  }
  QuerySnapshot querySnapshot6 =
      await FirebaseFirestore.instance.collection("devplantable").get();
  List docs6 = querySnapshot6.docs;
  indDevDataRows.clear();
  for (var doc in docs6) {
    var idpmodel =
        IndDevPlanModel('', '', '', '', '', '', '', '', '', '', '', '', '', '');
    idpmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    indDevDataRows.add(idpmodel);
  }
  QuerySnapshot querySnapshot7 =
      await FirebaseFirestore.instance.collection("monitortable").get();
  List docs7 = querySnapshot7.docs;
  monitoringDataRows.clear();
  for (var doc in docs7) {
    var momodel = MonitorToolModel('', '', '', '', '', '', '', '', '', 0, 0, '',
        '', 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '');
    momodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    monitoringDataRows.add(momodel);
  }
  QuerySnapshot querySnapshot8 =
      await FirebaseFirestore.instance.collection("stafftracktable").get();
  List docs8 = querySnapshot8.docs;
  stafftrackDataRows.clear();
  for (var doc in docs8) {
    var stmodel = StaffGrpTrackToolModel(
        '', '', '', '', '', '', '', '', '', '', '', '', '', '');
    stmodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    stafftrackDataRows.add(stmodel);
  }
  QuerySnapshot querySnapshot9 =
      await FirebaseFirestore.instance.collection("successstory").get();
  List docs9 = querySnapshot9.docs;
  successDataRows.clear();
  for (var doc in docs9) {
    var sumodel = SuccessStoryModel('', '', '', 0, '', '', '', '', '', '', '',
        '', '', 0, '', '', '', '', '', '', '');
    sumodel.fromMap(doc.id, doc.data()! as Map<String, dynamic>);
    successDataRows.add(sumodel);
  }
}

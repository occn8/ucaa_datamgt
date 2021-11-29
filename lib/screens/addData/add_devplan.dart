import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AddDevPlan extends StatefulWidget {
  const AddDevPlan({Key? key, required this.dataId}) : super(key: key);

  final String dataId;
  @override
  _AddDevPlanState createState() => _AddDevPlanState();
}

class _AddDevPlanState extends State<AddDevPlan> {
  final _formkey = GlobalKey<FormState>();
  final _dataMakingPlanController = TextEditingController();
  final _nameController = TextEditingController();
  final _grpNameController = TextEditingController();
  final _districtController = TextEditingController();
  final _subCountyController = TextEditingController();
  final _parishController = TextEditingController();
  final _villageController = TextEditingController();
  final _needsController = TextEditingController();
  final _actionsTakenController = TextEditingController();
  final _staffController = TextEditingController();
  final _dateController = TextEditingController();
  bool isUploading = false;

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
                          size: 28, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Text(
                  widget.dataId == ''
                      ? "Add Individual Dev Plan"
                      : "Update Individual Dev Plan",
                  style: TextStyle(
                      fontSize: !kIsWeb ? 18 : 20,
                      fontWeight: !kIsWeb ? FontWeight.w600 : FontWeight.bold),
                ),
                const SizedBox(width: 10)
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(50),
      ),
      body: SafeArea(
        child: GestureDetector(
          // onTap: () => FocusScope.of(context).unfocus(),
          child: isUploading == false
              ? SafeArea(
                  child: widget.dataId == ''
                      ? ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Form(
                              key: _formkey,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    formColumn(context),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            isUploading = true;
                                          });
                                          Map<String, dynamic> data = {
                                            'dataMakingPlan':
                                                _dataMakingPlanController
                                                    .value.text,
                                            'name': _nameController.value.text,
                                            'grpName':
                                                _grpNameController.value.text,
                                            'subCounty':
                                                _subCountyController.value.text,
                                            'district':
                                                _districtController.value.text,
                                            'parish':
                                                _parishController.value.text,
                                            'village':
                                                _villageController.value.text,
                                            'needs':
                                                _needsController.value.text,
                                            'actionsTaken':
                                                _actionsTakenController
                                                    .value.text,
                                            'staff':
                                                _staffController.value.text,
                                            'date': _dateController.value.text,
                                            'created':
                                                DateTime.now().toString(),
                                            'modified':
                                                DateTime.now().toString(),
                                          };
                                          CloudDatabase.addData(
                                                  data: data,
                                                  col: 'devplantable')
                                              .then((result) {
                                            if (result == null) {
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(buildSnackBar(
                                                      "Data Added to Database"));
                                              // Navigator.pushReplacement(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) => ()));
                                            } else {
                                              setState(() {
                                                isUploading = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      buildSnackBar(result));
                                            }
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      child: const Text(
                                        'Add Data',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : FutureBuilder<DocumentSnapshot>(
                          future: _firestore
                              .collection('devplantable')
                              .doc(widget.dataId)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return LinearProgressIndicator(
                                  color: Theme.of(context).primaryColor);
                            }

                            if (snapshot.hasData && !snapshot.data!.exists) {}
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            _dataMakingPlanController.text =
                                data['dataMakingPlan'];
                            _nameController.text = data['name'];
                            _grpNameController.text = data['grpName'];
                            _districtController.text = data['district'];
                            _subCountyController.text = data['subCounty'];
                            _parishController.text = data['parish'];
                            _villageController.text = data['village'];
                            _needsController.text = data['needs'];
                            _actionsTakenController.text = data['actionsTaken'];
                            _staffController.text = data['staff'];
                            _dateController.text = data['date'];
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: const Text(
                                    'Update Data',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Form(
                                  key: _formkey,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        formColumn(context),
                                        const SizedBox(height: 40),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              setState(() {
                                                isUploading = true;
                                              });
                                              FocusScope.of(context).unfocus();

                                              Map<String, dynamic> data = {
                                                'dataMakingPlan':
                                                    _dataMakingPlanController
                                                        .value.text,
                                                'name':
                                                    _nameController.value.text,
                                                'grpName': _grpNameController
                                                    .value.text,
                                                'subCounty':
                                                    _subCountyController
                                                        .value.text,
                                                'district': _districtController
                                                    .value.text,
                                                'parish': _parishController
                                                    .value.text,
                                                'village': _villageController
                                                    .value.text,
                                                'needs':
                                                    _needsController.value.text,
                                                'actionsTaken':
                                                    _actionsTakenController
                                                        .value.text,
                                                'staff':
                                                    _staffController.value.text,
                                                'date':
                                                    _dateController.value.text,
                                                'modified':
                                                    DateTime.now().toString(),
                                              };
                                              CloudDatabase.updateData(
                                                      data: data,
                                                      docId: widget.dataId,
                                                      col: 'devplantable')
                                                  .then((result) {
                                                if (result == null) {
                                                  setState(() {
                                                    isUploading = false;
                                                  });
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(buildSnackBar(
                                                          "Data Updated successfully"));
                                                } else {
                                                  setState(() {
                                                    isUploading = false;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          buildSnackBar(
                                                              result));
                                                }
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).primaryColor,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Update Data',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                )
              : const SafeArea(child: LinearProgressIndicator()),
        ),
      ),
    );
  }

  Column formColumn(BuildContext context) {
    return Column(
      children: [
        buildTextFormField(context, _dataMakingPlanController,
            'Date of making the plan', "21/2/2021"),
        buildTextFormField(context, _nameController, 'Name of Member', "name"),
        buildTextFormField(context, _grpNameController, 'Group Name', ""),
        buildTextFormField(context, _districtController, 'District', ""),
        buildTextFormField(context, _subCountyController, 'Sub-County', ""),
        buildTextFormField(context, _parishController, 'Parish', ""),
        buildTextFormField(context, _villageController, 'Village', ""),
        buildTextFormField(context, _needsController, 'Needs', "", mxl: 5),
        buildTextFormField(context, _actionsTakenController,
            'Actions to be taken/services needed', "",
            mxl: 5),
        buildTextFormField(
            context, _staffController, 'Title&Name of staff', ""),
        buildTextFormField(context, _dateController, 'Date', "30/3/2021"),
      ],
    );
  }

  @override
  void dispose() {
    _dataMakingPlanController.dispose();
    _nameController.dispose();
    _grpNameController.dispose();
    _districtController.dispose();
    _subCountyController.dispose();
    _parishController.dispose();
    _villageController.dispose();
    _needsController.dispose();
    _actionsTakenController.dispose();
    _staffController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}

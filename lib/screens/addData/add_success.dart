import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AddSuccess extends StatefulWidget {
  const AddSuccess({Key? key, required this.dataId}) : super(key: key);

  final String dataId;
  @override
  _AddSuccessState createState() => _AddSuccessState();
}

class _AddSuccessState extends State<AddSuccess> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _maritalStatusController = TextEditingController();
  final _numChildrenController = TextEditingController();
  final _dateController = TextEditingController();
  final _sexController = TextEditingController();
  final _ageController = TextEditingController();
  final _districtController = TextEditingController();
  final _subCountyController = TextEditingController();
  final _parishController = TextEditingController();
  final _villageController = TextEditingController();
  final _groupNameController = TextEditingController();
  final _yrOfEncounterAndHowController = TextEditingController();
  final _lifeBeforeEncounterController = TextEditingController();
  final _capacityBuildingController = TextEditingController();
  final _changesInLifeComparedToBeforeController = TextEditingController();
  final _otherInfluencesThatChangedLifeController = TextEditingController();
  final _futurePlanController = TextEditingController();
  final _otherCommentsController = TextEditingController();
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
                  widget.dataId == '' ? "Add Story" : "Edit Story",
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
        child: GestureDetector(
          child: isUploading == false
              ? SafeArea(
                  child: widget.dataId == ''
                      ? ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: const Text(
                                'Add Success Story',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Form(
                              key: _formkey,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    buildTextFormField(
                                      context,
                                      _nameController,
                                      'Name',
                                      "john doe",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _maritalStatusController,
                                      'Marital-Status',
                                      "Married",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _parishController,
                                      'Parish',
                                      "parish-name",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _dateController,
                                      'Date',
                                      "1/1/2008",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _sexController,
                                      'Sex',
                                      "Female/Male",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _ageController,
                                      'Age',
                                      "25",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _districtController,
                                      'District',
                                      "gulu",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _subCountyController,
                                      'Sub-county',
                                      "sub-county",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _villageController,
                                      'Village',
                                      "village-name",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _numChildrenController,
                                      'Number of Children',
                                      "2",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _groupNameController,
                                      'Group Name',
                                      "group-nane",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _yrOfEncounterAndHowController,
                                      'Year of first encounter with UCAA and how',
                                      "...",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _lifeBeforeEncounterController,
                                      'Life before encounter with UCAA',
                                      "...",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _capacityBuildingController,
                                      'Capacity building/trainings provided by UCAA',
                                      "...",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _changesInLifeComparedToBeforeController,
                                      'Changes in yuor life right now compared to before the UCAA encounter',
                                      "..",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _otherInfluencesThatChangedLifeController,
                                      'Other influences beside UCAA that changed your life(own effort/gov./other Ngos)',
                                      "...",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _futurePlanController,
                                      'Future Plan',
                                      "...",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _otherCommentsController,
                                      'Any Other comments on your story',
                                      "...",
                                      TextInputType.text,
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            isUploading = true;
                                          });
                                          Map<String, dynamic> data = {
                                            'name': _nameController.value.text,
                                            'maritalStatus':
                                                _maritalStatusController
                                                    .value.text,
                                            'numChildren': int.parse(
                                                _numChildrenController
                                                    .value.text),
                                            'date': _dateController.value.text,
                                            'sex': _sexController.value.text,
                                            'age': int.parse(
                                                _ageController.value.text),
                                            'district':
                                                _districtController.value.text,
                                            'subCounty':
                                                _subCountyController.value.text,
                                            'parish':
                                                _parishController.value.text,
                                            'village':
                                                _villageController.value.text,
                                            'groupName':
                                                _groupNameController.value.text,
                                            'yrOfEncounterAndHow':
                                                _yrOfEncounterAndHowController
                                                    .value.text,
                                            'lifeBeforeEncounter':
                                                _lifeBeforeEncounterController
                                                    .value.text,
                                            'capacityBuilding':
                                                _capacityBuildingController
                                                    .value.text,
                                            'changesInLifeComparedToBefore':
                                                _changesInLifeComparedToBeforeController
                                                    .value.text,
                                            'otherInfluencesThatChangedLife':
                                                _otherInfluencesThatChangedLifeController
                                                    .value.text,
                                            'futurePlan': _futurePlanController
                                                .value.text,
                                            'otherComments':
                                                _otherCommentsController
                                                    .value.text,
                                            'created':
                                                DateTime.now().toString(),
                                            'modified':
                                                DateTime.now().toString(),
                                          };
                                          CloudDatabase.addData(
                                            data: data,
                                            col: 'successstory',
                                          ).then((result) {
                                            if (result == null) {
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(buildSnackBar(
                                                      "Data Added to Database"));
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
                                        'Add Story',
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
                              .collection('successstory')
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
                            _nameController.text = data['groupName'];
                            _maritalStatusController.text = data['subCounty'];
                            _parishController.text = data['parish'];
                            _dateController.text = data['gdFormed'];
                            _sexController.text = data['numMembers'].toString();
                            _ageController.text = data['segMale'].toString();
                            _districtController.text =
                                data['segFemale'].toString();
                            _subCountyController.text =
                                data['timesSharedOut'].toString();
                            _villageController.text =
                                data['shareValue'].toString();
                            _numChildrenController.text =
                                data['numChildren'].toString();
                            _groupNameController.text =
                                data['amntHighestSaver'].toString();
                            _yrOfEncounterAndHowController.text =
                                data['amntSaved'].toString();
                            _lifeBeforeEncounterController.text =
                                data['amntSocialFund'].toString();
                            _capacityBuildingController.text =
                                data['amntLoansTaken'].toString();
                            _changesInLifeComparedToBeforeController.text =
                                data['numLoansAccessed'].toString();
                            _otherInfluencesThatChangedLifeController.text =
                                data['loanRepayment'].toString();
                            _futurePlanController.text =
                                data['amntLoansWrittenoff'].toString();
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: const Text(
                                    'Update Success Story',
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
                                        buildTextFormField(
                                          context,
                                          _nameController,
                                          'Name',
                                          "john doe",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _maritalStatusController,
                                          'Marital-Status',
                                          "Married",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _parishController,
                                          'Parish',
                                          "parish-name",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _dateController,
                                          'Date',
                                          "1/1/2008",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _sexController,
                                          'Sex',
                                          "Female/Male",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _ageController,
                                          'Age',
                                          "25",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _districtController,
                                          'District',
                                          "gulu",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _subCountyController,
                                          'Sub-county',
                                          "sub-county",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _villageController,
                                          'Village',
                                          "village-name",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _numChildrenController,
                                          'Number of Children',
                                          "2",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _groupNameController,
                                          'Group Name',
                                          "group-nane",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _yrOfEncounterAndHowController,
                                          'Year of first encounter with UCAA and how',
                                          "...",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _lifeBeforeEncounterController,
                                          'Life before encounter with UCAA',
                                          "...",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _capacityBuildingController,
                                          'Capacity building/trainings provided by UCAA',
                                          "...",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _changesInLifeComparedToBeforeController,
                                          'Changes in yuor life right now compared to before the UCAA encounter',
                                          "..",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _otherInfluencesThatChangedLifeController,
                                          'Other influences beside UCAA that changed your life(own effort/gov./other Ngos)',
                                          "...",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _futurePlanController,
                                          'Future Plan',
                                          "...",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _otherCommentsController,
                                          'Any Other comments on your story',
                                          "...",
                                          TextInputType.text,
                                        ),
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
                                                'name':
                                                    _nameController.value.text,
                                                'maritalStatus':
                                                    _maritalStatusController
                                                        .value.text,
                                                'numChildren': int.parse(
                                                    _numChildrenController
                                                        .value.text),
                                                'date':
                                                    _dateController.value.text,
                                                'sex':
                                                    _sexController.value.text,
                                                'age': int.parse(
                                                    _ageController.value.text),
                                                'district': _districtController
                                                    .value.text,
                                                'subCounty':
                                                    _subCountyController
                                                        .value.text,
                                                'parish': _parishController
                                                    .value.text,
                                                'village': _villageController
                                                    .value.text,
                                                'groupName':
                                                    _groupNameController
                                                        .value.text,
                                                'yrOfEncounterAndHow':
                                                    _yrOfEncounterAndHowController
                                                        .value.text,
                                                'lifeBeforeEncounter':
                                                    _lifeBeforeEncounterController
                                                        .value.text,
                                                'capacityBuilding':
                                                    _capacityBuildingController
                                                        .value.text,
                                                'changesInLifeComparedToBefore':
                                                    _changesInLifeComparedToBeforeController
                                                        .value.text,
                                                'otherInfluencesThatChangedLife':
                                                    _otherInfluencesThatChangedLifeController
                                                        .value.text,
                                                'futurePlan':
                                                    _futurePlanController
                                                        .value.text,
                                                'otherComments':
                                                    _otherCommentsController
                                                        .value.text,
                                                'modified':
                                                    DateTime.now().toString(),
                                              };
                                              CloudDatabase.updateData(
                                                      data: data,
                                                      docId: widget.dataId,
                                                      col: 'cartable')
                                                  .then((result) {
                                                if (result == null) {
                                                  setState(() {
                                                    isUploading = false;
                                                  });
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(buildSnackBar(
                                                          "Updated successfully"));
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

  buildTextFormField(BuildContext context, TextEditingController control,
      String label, String hint, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: control,
        style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.green)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(15),
          labelText: label,
          labelStyle:
              TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        keyboardType: type,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _ageController.dispose();
    _parishController.dispose();
    _maritalStatusController.dispose();
    _sexController.dispose();
    super.dispose();
  }
}

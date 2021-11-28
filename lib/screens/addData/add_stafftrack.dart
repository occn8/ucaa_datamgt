import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AddStaffTrack extends StatefulWidget {
  const AddStaffTrack({Key? key, required this.dataId}) : super(key: key);

  final String dataId;
  @override
  _AddStaffTrackState createState() => _AddStaffTrackState();
}

class _AddStaffTrackState extends State<AddStaffTrack> {
  final _formkey = GlobalKey<FormState>();
  final _projectController = TextEditingController();
  final _areaOfOpController = TextEditingController();
  final _staffNameController = TextEditingController();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthUnderReviewController = TextEditingController();
  final _yearController = TextEditingController();
  final _grpNameController = TextEditingController();
  final _lessonsLearntController = TextEditingController();
  final _challengesFacedController = TextEditingController();
  final _possibleSolutionController = TextEditingController();
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
                  widget.dataId == '' ? "Add Data" : "Edit Data",
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
          // onTap: () => FocusScope.of(context).unfocus(),
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
                                'Add Staff Tracking Tools Data',
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
                                            'project':
                                                _projectController.value.text,
                                            'areaOfOp':
                                                _areaOfOpController.value.text,
                                            'staffName':
                                                _staffNameController.value.text,
                                            'monthUnderReview':
                                                _monthUnderReviewController
                                                    .value.text,
                                            'title':
                                                _titleController.value.text,
                                            'year': _yearController.value.text,
                                            'grpName':
                                                _grpNameController.value.text,
                                            'lessonsLearnt':
                                                _lessonsLearntController
                                                    .value.text,
                                            'challengesFaced':
                                                _challengesFacedController
                                                    .value.text,
                                            'possibleSolution':
                                                _possibleSolutionController
                                                    .value.text,
                                            'date': _dateController.value.text,
                                            'created':
                                                DateTime.now().toString(),
                                            'modified':
                                                DateTime.now().toString(),
                                          };
                                          CloudDatabase.addData(
                                                  data: data,
                                                  col: 'stafftracktable')
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
                              .collection('stafftracktable')
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
                            _projectController.text = data['project'];
                            _areaOfOpController.text = data['areaOfOp'];
                            _staffNameController.text = data['staffName'];
                            _titleController.text = data['title'];
                            _monthUnderReviewController.text =
                                data['monthUnderReview'];
                            _yearController.text = data['year'];
                            _grpNameController.text = data['grpName'];
                            _lessonsLearntController.text =
                                data['lessonsLearnt'];
                            _challengesFacedController.text =
                                data['challengesFaced'];
                            _possibleSolutionController.text =
                                data['possibleSolution'];
                            _dateController.text = data['date'];
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: const Text(
                                    'Update Staff Tracking Tools',
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
                                                'project': _projectController
                                                    .value.text,
                                                'areaOfOp': _areaOfOpController
                                                    .value.text,
                                                'staffName':
                                                    _staffNameController
                                                        .value.text,
                                                'monthUnderReview':
                                                    _monthUnderReviewController
                                                        .value.text,
                                                'title':
                                                    _titleController.value.text,
                                                'year':
                                                    _yearController.value.text,
                                                'grpName': _grpNameController
                                                    .value.text,
                                                'lessonsLearnt':
                                                    _lessonsLearntController
                                                        .value.text,
                                                'challengesFaced':
                                                    _challengesFacedController
                                                        .value.text,
                                                'possibleSolution':
                                                    _possibleSolutionController
                                                        .value.text,
                                                'date':
                                                    _dateController.value.text,
                                                'modified':
                                                    DateTime.now().toString(),
                                              };
                                              CloudDatabase.updateData(
                                                      data: data,
                                                      docId: widget.dataId,
                                                      col: 'stafftracktable')
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
        buildTextFormField(context, _projectController, 'Project', ""),
        buildTextFormField(
            context, _areaOfOpController, 'Area of Operation', ""),
        buildTextFormField(context, _staffNameController, 'Name of staff', ""),
        buildTextFormField(context, _titleController, 'Title', ""),
        buildTextFormField(
            context, _monthUnderReviewController, 'Month Under review', ""),
        buildTextFormField(context, _yearController, 'Year', ""),
        buildTextFormField(
            context, _grpNameController, 'Name of Group under support', ""),
        buildTextFormField(context, _lessonsLearntController,
            'Lessons learnt & best practices', "",
            mxl: 5),
        buildTextFormField(context, _challengesFacedController,
            'Challenges faced during the month', "",
            mxl: 5),
        buildTextFormField(context, _possibleSolutionController,
            'Possible solutions suggested', "",
            mxl: 5),
        buildTextFormField(
            context, _dateController, 'Date of reporting', "30/3/2021"),
      ],
    );
  }

  buildTextFormField(BuildContext context, TextEditingController control,
      String label, String hint,
      {TextInputType type = TextInputType.text, int mxl = 1}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: control,
        textInputAction: TextInputAction.next,
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
        maxLines: mxl,
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
    _projectController.dispose();
    _titleController.dispose();
    _staffNameController.dispose();
    _areaOfOpController.dispose();
    _monthUnderReviewController.dispose();
    super.dispose();
  }
}

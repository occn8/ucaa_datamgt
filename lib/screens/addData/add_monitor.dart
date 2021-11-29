import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AddMonitoring extends StatefulWidget {
  const AddMonitoring({Key? key, required this.dataId}) : super(key: key);

  final String dataId;
  @override
  _AddMonitoringState createState() => _AddMonitoringState();
}

class _AddMonitoringState extends State<AddMonitoring> {
  final _formkey = GlobalKey<FormState>();
  final _collectorNameController = TextEditingController();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _grpNameController = TextEditingController();
  final _numMembersController = TextEditingController();
  final _numMaleController = TextEditingController();
  final _numFemaleController = TextEditingController();
  final _subCountyController = TextEditingController();
  final _parishController = TextEditingController();
  final _villageController = TextEditingController();
  final _reportQuarterController = TextEditingController();
  final _monthController = TextEditingController();
  final _totalSavingsController = TextEditingController();
  final _loanAmtGivenOutController = TextEditingController();
  final _loanRepaymentAmtController = TextEditingController();
  final _totalSocialFundController = TextEditingController();
  final _remarksController = TextEditingController();
  final _numMemeberWithIGAController = TextEditingController();
  final _numMembersIGAcollapsedController = TextEditingController();
  final _numMembersIGAmaitainedController = TextEditingController();
  final _numMembersNewIGAController = TextEditingController();
  final _anyIGAyesORnoController = TextEditingController();
  final _ifYesWhichIGAController = TextEditingController();
  final _summaryOFArchievementsController = TextEditingController();
  final _challengesController = TextEditingController();
  final _solutionsController = TextEditingController();
  final _grpActionPlanController = TextEditingController();
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
                      ? "Add Monitoring Tool Data"
                      : "Edit Monitoring Tool Data",
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
                                            'collectorName':
                                                _collectorNameController
                                                    .value.text,
                                            'title':
                                                _titleController.value.text,
                                            'grpName':
                                                _grpNameController.value.text,
                                            'numMale': int.parse(
                                                _numMaleController.value.text),
                                            'numMembers': int.parse(
                                                _numMembersController
                                                    .value.text),
                                            'numFemale': int.parse(
                                                _numFemaleController
                                                    .value.text),
                                            'subCounty':
                                                _subCountyController.value.text,
                                            'parish':
                                                _parishController.value.text,
                                            'village':
                                                _villageController.value.text,
                                            'reportQuarter':
                                                _reportQuarterController
                                                    .value.text,
                                            'date': _dateController.value.text,
                                            'month':
                                                _monthController.value.text,
                                            'totalSavings': int.parse(
                                                _totalSavingsController
                                                    .value.text),
                                            'loanAmtGivenOut': int.parse(
                                                _loanAmtGivenOutController
                                                    .value.text),
                                            'loanRepaymentAmt': int.parse(
                                                _loanRepaymentAmtController
                                                    .value.text),
                                            'totalSocialFund': int.parse(
                                                _totalSocialFundController
                                                    .value.text),
                                            'remarks':
                                                _remarksController.value.text,
                                            'numMemeberWithIGA': int.parse(
                                                _numMemeberWithIGAController
                                                    .value.text),
                                            'numMembersIGAcollapsed': int.parse(
                                                _numMembersIGAcollapsedController
                                                    .value.text),
                                            'numMembersIGAmaitained': int.parse(
                                                _numMembersIGAmaitainedController
                                                    .value.text),
                                            'numMembersNewIGA': int.parse(
                                                _numMembersNewIGAController
                                                    .value.text),
                                            'anyIGAyesORno':
                                                _anyIGAyesORnoController
                                                    .value.text,
                                            'ifYesWhichIGA':
                                                _ifYesWhichIGAController
                                                    .value.text,
                                            'summaryOFArchievements':
                                                _summaryOFArchievementsController
                                                    .value.text,
                                            'challenges': _challengesController
                                                .value.text,
                                            'solutions':
                                                _solutionsController.value.text,
                                            'grpActionPlan':
                                                _grpActionPlanController
                                                    .value.text,
                                            'created':
                                                DateTime.now().toString(),
                                            'modified':
                                                DateTime.now().toString(),
                                          };
                                          CloudDatabase.addData(
                                                  data: data,
                                                  col: 'monitortable')
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
                              .collection('monitortable')
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
                            _collectorNameController.text =
                                data['collectorName'];
                            _titleController.text = data['title'];
                            _dateController.text = data['date'];
                            _grpNameController.text = data['grpName'];
                            _numMembersController.text =
                                data['numMembers'].toString();
                            _numMaleController.text =
                                data['numMale'].toString();
                            _numFemaleController.text =
                                data['numFemale'].toString();
                            _subCountyController.text = data['subCounty'];
                            _parishController.text = data['parish'];
                            _villageController.text = data['village'];
                            _reportQuarterController.text =
                                data['reportQuarter'];
                            _monthController.text = data['month'];
                            _totalSavingsController.text =
                                data['totalSavings'].toString();
                            _loanAmtGivenOutController.text =
                                data['loanAmtGivenOut'].toString();
                            _loanRepaymentAmtController.text =
                                data['loanRepaymentAmt'].toString();
                            _totalSocialFundController.text =
                                data['totalSocialFund'].toString();
                            _remarksController.text = data['remarks'];
                            _numMemeberWithIGAController.text =
                                data['numMemeberWithIGA'].toString();
                            _numMembersIGAcollapsedController.text =
                                data['numMembersIGAcollapsed'].toString();
                            _numMembersIGAmaitainedController.text =
                                data['numMembersIGAmaitained'].toString();
                            _numMembersNewIGAController.text =
                                data['numMembersNewIGA'].toString();
                            _anyIGAyesORnoController.text =
                                data['anyIGAyesORno'];
                            _ifYesWhichIGAController.text =
                                data['ifYesWhichIGA'];
                            _summaryOFArchievementsController.text =
                                data['summaryOFArchievements'];
                            _challengesController.text = data['challenges'];
                            _solutionsController.text = data['solutions'];
                            _grpActionPlanController.text =
                                data['grpActionPlan'];
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
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
                                                'collectorName':
                                                    _collectorNameController
                                                        .value.text,
                                                'title':
                                                    _titleController.value.text,
                                                'grpName': _grpNameController
                                                    .value.text,
                                                'numMale': int.parse(
                                                    _numMaleController
                                                        .value.text),
                                                'numMembers': int.parse(
                                                    _numMembersController
                                                        .value.text),
                                                'numFemale': int.parse(
                                                    _numFemaleController
                                                        .value.text),
                                                'subCounty':
                                                    _subCountyController
                                                        .value.text,
                                                'parish': _parishController
                                                    .value.text,
                                                'village': _villageController
                                                    .value.text,
                                                'reportQuarter':
                                                    _reportQuarterController
                                                        .value.text,
                                                'date':
                                                    _dateController.value.text,
                                                'month':
                                                    _monthController.value.text,
                                                'totalSavings': int.parse(
                                                    _totalSavingsController
                                                        .value.text),
                                                'loanAmtGivenOut': int.parse(
                                                    _loanAmtGivenOutController
                                                        .value.text),
                                                'loanRepaymentAmt': int.parse(
                                                    _loanRepaymentAmtController
                                                        .value.text),
                                                'totalSocialFund': int.parse(
                                                    _totalSocialFundController
                                                        .value.text),
                                                'remarks': _remarksController
                                                    .value.text,
                                                'numMemeberWithIGA': int.parse(
                                                    _numMemeberWithIGAController
                                                        .value.text),
                                                'numMembersIGAcollapsed': int.parse(
                                                    _numMembersIGAcollapsedController
                                                        .value.text),
                                                'numMembersIGAmaitained': int.parse(
                                                    _numMembersIGAmaitainedController
                                                        .value.text),
                                                'numMembersNewIGA': int.parse(
                                                    _numMembersNewIGAController
                                                        .value.text),
                                                'anyIGAyesORno':
                                                    _anyIGAyesORnoController
                                                        .value.text,
                                                'ifYesWhichIGA':
                                                    _ifYesWhichIGAController
                                                        .value.text,
                                                'summaryOFArchievements':
                                                    _summaryOFArchievementsController
                                                        .value.text,
                                                'challenges':
                                                    _challengesController
                                                        .value.text,
                                                'solutions':
                                                    _solutionsController
                                                        .value.text,
                                                'grpActionPlan':
                                                    _grpActionPlanController
                                                        .value.text,
                                                'modified':
                                                    DateTime.now().toString(),
                                              };
                                              CloudDatabase.updateData(
                                                      data: data,
                                                      docId: widget.dataId,
                                                      col: 'monitortable')
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
        buildTextFormField(
            context, _collectorNameController, 'Name of Data Collector', ""),
        buildTextFormField(context, _titleController, 'Title', ""),
        buildTextFormField(
            context, _grpNameController, 'Name of the group', ""),
        buildTextFormField(context, _numMembersController, 'Total members', "",
            type: TextInputType.number),
        buildTextFormField(context, _numMaleController, 'Male', "15",
            type: TextInputType.number),
        buildTextFormField(context, _numFemaleController, 'Female', "15",
            type: TextInputType.number),
        buildTextFormField(context, _subCountyController, 'Sub-County', ""),
        buildTextFormField(context, _parishController, 'Parish', ""),
        buildTextFormField(context, _villageController, 'Village', ""),
        buildTextFormField(
            context, _reportQuarterController, 'Reporting Quarter', ""),
        buildTextFormField(context, _monthController, 'Month', "Jan"),
        buildTextFormField(context, _totalSavingsController,
            'Total Savings for this month', "300000",
            type: TextInputType.number),
        buildTextFormField(context, _loanAmtGivenOutController,
            'Loan amount given out this month', "10000",
            type: TextInputType.number),
        buildTextFormField(context, _loanRepaymentAmtController,
            'Loan repayment amount this month', "1000",
            type: TextInputType.number),
        buildTextFormField(context, _totalSocialFundController,
            'Total Social fund this month', "5000",
            type: TextInputType.number),
        buildTextFormField(context, _numMemeberWithIGAController,
            'Number of members with IGAs', "30",
            type: TextInputType.number),
        buildTextFormField(context, _numMembersNewIGAController,
            'Number of members who revived or started the new IGAs', "",
            type: TextInputType.number),
        buildTextFormField(context, _numMembersIGAcollapsedController,
            'Number of members whose IGAs collapsed', "",
            type: TextInputType.number),
        buildTextFormField(context, _numMembersIGAmaitainedController,
            'Number of members whose IGAs are maitained', "",
            type: TextInputType.number),
        buildTextFormField(
            context,
            _anyIGAyesORnoController,
            'Does your group have any income generating activities/projects',
            "yes/no"),
        buildTextFormField(
            context, _ifYesWhichIGAController, 'If yes, which type of IGA', ""),
        buildTextFormField(context, _summaryOFArchievementsController,
            'Summary of Group achievements', "",
            mxl: 5),
        buildTextFormField(
            context, _challengesController, 'Challenges encountered', "",
            mxl: 5),
        buildTextFormField(
            context, _solutionsController, 'Proposed solutions', "",
            mxl: 5),
        buildTextFormField(context, _grpActionPlanController,
            'Group Action Plan(activities planned)', "",
            mxl: 5),
        buildTextFormField(context, _remarksController, 'Remarks', "", mxl: 5),
        buildTextFormField(context, _dateController, 'Date', "30/3/2021"),
      ],
    );
  }

  @override
  void dispose() {
    _collectorNameController.dispose();
    _titleController.dispose();
    _dateController.dispose();
    _grpNameController.dispose();
    _numMembersController.dispose();
    _numMaleController.dispose();
    _numFemaleController.dispose();
    _subCountyController.dispose();
    _parishController.dispose();
    _villageController.dispose();
    _reportQuarterController.dispose();
    _monthController.dispose();
    _totalSavingsController.dispose();
    _loanAmtGivenOutController.dispose();
    _loanRepaymentAmtController.dispose();
    _totalSocialFundController.dispose();
    _remarksController.dispose();
    _numMemeberWithIGAController.dispose();
    _numMembersIGAcollapsedController.dispose();
    _numMembersIGAmaitainedController.dispose();
    _numMembersNewIGAController.dispose();
    _anyIGAyesORnoController.dispose();
    _ifYesWhichIGAController.dispose();
    _summaryOFArchievementsController.dispose();
    _challengesController.dispose();
    _solutionsController.dispose();
    _grpActionPlanController.dispose();
    super.dispose();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class AddWid extends StatefulWidget {
  const AddWid({Key? key, required this.dataId}) : super(key: key);

  final String dataId;
  @override
  _AddWidState createState() => _AddWidState();
}

class _AddWidState extends State<AddWid> {
  final _formkey = GlobalKey<FormState>();
  final _groupName = TextEditingController();
  final _subCountyController = TextEditingController();
  final _parishController = TextEditingController();
  final _gdFormedController = TextEditingController();
  final _numMembersController = TextEditingController();
  final _timesSharedOutController = TextEditingController();
  final _shareValueController = TextEditingController();
  final _numChildrenController = TextEditingController();
  final _amntHighestSaverController = TextEditingController();
  final _amntSavedController = TextEditingController();
  final _amntSocialFundController = TextEditingController();
  final _amntLoansTakenController = TextEditingController();
  final _numLoansAccessedController = TextEditingController();
  final _loanRepaymentController = TextEditingController();
  final _amntLoansWrittenoffController = TextEditingController();
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
                          size: 28, color: Theme.of(context).primaryColorDark),
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
                                'Add Product to Store',
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
                                      _groupName,
                                      'Product Name',
                                      "Oral tooth brush",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _gdFormedController,
                                      'Brand',
                                      "Gucci",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _subCountyController,
                                      'Product Price',
                                      "5,000",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _numMembersController,
                                      'Product Quantity',
                                      "15",
                                      TextInputType.number,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _timesSharedOutController,
                                      'Product Description',
                                      "This is an Oral tooth brush",
                                      TextInputType.text,
                                    ),
                                    buildTextFormField(
                                      context,
                                      _parishController,
                                      'Image Name',
                                      "oralimage",
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
                                            'price': int.parse(
                                                _subCountyController
                                                    .value.text),
                                            'pdtName': _groupName.value.text,
                                            'brand':
                                                _gdFormedController.value.text,
                                            'pdtQuantity': int.parse(
                                                _numMembersController
                                                    .value.text),
                                            'description':
                                                _timesSharedOutController
                                                    .value.text,
                                            "likes": FieldValue.arrayUnion([]),
                                            "viewed": FieldValue.arrayUnion([]),
                                            "comments":
                                                FieldValue.arrayUnion([]),
                                            'created':
                                                DateTime.now().toString(),
                                            'modified':
                                                DateTime.now().toString(),
                                          };
                                          CloudDatabase.addData(data: data)
                                              .then((result) {
                                            if (result == null) {
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(buildSnackBar(
                                                      "Product Added to Database"));
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
                                        'Add Product',
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
                              .collection('products')
                              .doc(widget.dataId)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const LinearProgressIndicator();
                            }

                            if (snapshot.hasData && !snapshot.data!.exists) {}
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            _groupName.text = data['pdtName'];
                            _gdFormedController.text = data['brand'];
                            _subCountyController.text =
                                data['price'].toString();
                            _numMembersController.text =
                                data['pdtQuantity'].toString();
                            _timesSharedOutController.text =
                                data['description'];
                            return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: const Text(
                                    'Update Product In Store',
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
                                          _groupName,
                                          'Product Name',
                                          "Oral tooth brush",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _gdFormedController,
                                          'Brand',
                                          "Gucci",
                                          TextInputType.text,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _subCountyController,
                                          'Product Price',
                                          "5,000",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _numMembersController,
                                          'Product Quantity',
                                          "15",
                                          TextInputType.number,
                                        ),
                                        buildTextFormField(
                                          context,
                                          _timesSharedOutController,
                                          'Product Description',
                                          "This is an Oral tooth brush",
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
                                                'price': int.parse(
                                                    _subCountyController
                                                        .value.text),
                                                'pdtName':
                                                    _groupName.value.text,
                                                'brand': _gdFormedController
                                                    .value.text,
                                                'pdtQuantity': int.parse(
                                                    _numMembersController
                                                        .value.text),
                                                'description':
                                                    _timesSharedOutController
                                                        .value.text,
                                                'modified':
                                                    DateTime.now().toString(),
                                              };
                                              CloudDatabase.updateData(
                                                      data: data,
                                                      docId: widget.dataId)
                                                  .then((result) {
                                                if (result == null) {
                                                  setState(() {
                                                    isUploading = false;
                                                  });
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(buildSnackBar(
                                                          "Product Updated successfully"));
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
                                            'Update Product',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                        ElevatedButton(
                                          onPressed: () async {
                                            // Navigator.pushReplacement(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             DeletePdt(
                                            //               pdtId: widget.pdtId,
                                            //             )));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).errorColor,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Delete Product',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
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
        style: TextStyle(color: Theme.of(context).primaryColorDark),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xffffb300))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(15),
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
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
    _groupName.dispose();
    _gdFormedController.dispose();
    _timesSharedOutController.dispose();
    _parishController.dispose();
    _subCountyController.dispose();
    _numMembersController.dispose();
    super.dispose();
  }
}
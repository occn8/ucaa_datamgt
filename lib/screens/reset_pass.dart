import 'package:ucaa_datamgt/index.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(onListen);
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: new EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back,
                                      size: 25,
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  const Text(
                                    ' Back',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 10,
                child: Form(
                  key: _formkey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Reset Password',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Please Input Email to continue',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 55),
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark),
                          cursorColor: Colors.green,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            labelText: ' Email',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColorDark),
                            hintText: 'johndoe@gmail.com',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            suffixIcon: _emailController.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () => _emailController.clear(),
                                  ),
                          ),
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please enter correct email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 35),
                        isLoading != true
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    AuthenticationHelper()
                                        .verifReset(
                                            email: _emailController.text)
                                        .then((result) {
                                      if (result == null) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return SimpleDialog(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .backgroundColor,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 25,
                                                        horizontal: 10),
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColorDark,
                                                                fontSize: 15),
                                                            text:
                                                                'Reset Link sent to ${_emailController.text}\n\n'),
                                                        TextSpan(
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColorDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                            ),
                                                            text:
                                                                'Please check Your Email'),
                                                        const TextSpan(
                                                            // style: textStyle,
                                                            text: ''),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                        setState(() {
                                          isLoading = false;
                                        });
                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             UserTypeLander()));
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                buildSnackBar(result));
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  'Submit Email',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
                            : Column(
                                children: [
                                  LinearProgressIndicator(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      color: Theme.of(context).primaryColor),
                                  const SizedBox(height: 5),
                                  Text('Sending Email...',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Theme.of(context).primaryColor)),
                                ],
                              ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.removeListener(onListen);
    _emailController.dispose();
    super.dispose();
  }
}

// final FirebaseAuth _auth = FirebaseAuth.instance;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ucaa_datamgt/index.dart';

class AuthStatus extends StatefulWidget {
  const AuthStatus({Key? key}) : super(key: key);

  @override
  _AuthStatusState createState() => _AuthStatusState();
}

class _AuthStatusState extends State<AuthStatus> {
  // User? auser;
  @override
  void initState() {
    // auser = _auth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final appModel = Provider.of<AppModel>(context);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          // auser = _auth.currentUser;
          if (user != null) {
            // if (auser!.emailVerified) {
            return const Home();
            // } else {
            //   return VerifyEmail();
            // }
          }
          return const SignIn();
        } else {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).backgroundColor,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Loading App...',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

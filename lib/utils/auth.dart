import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ucaa_datamgt/index.dart';

setRolePref(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userRole', value);
}

// Future<String> getRole() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString('userRole') ?? 'Viewer';
// }

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  Future signUp(
      {required String email,
      required String password,
      required String? role,
      required String userName}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          await _auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) {
            user.updateProfile(displayName: userName);
            CloudDatabase.addUser(data: {
              'email': email,
              'userName': userName,
              'role': role,
              'status': 1,
              'created': DateTime.now().toString(),
            }, doc: user.uid);
            setRolePref(role!);
            usrrole = role;
          });

          return null;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            return 'The password provided is too weak.';
          } else if (e.code == 'email-already-in-use') {
            return 'The account already exists for that email.';
          }
          return e.message;
        } catch (e) {
          return 'An Error Has Occured';
        }
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  Future signIn({required String email, required String password}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          await _auth.signInWithEmailAndPassword(
              email: email, password: password);
          await CloudDatabase.getUserInfo(doc: user.uid);

          return null;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            return 'No user found for that Email.';
          } else if (e.code == 'wrong-password') {
            return 'Wrong password provided for that User.';
          }
          return e.message;
        } catch (e) {
          return 'An Error Has Occured';
        }
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  Future verifReset({required String email}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          await _auth.sendPasswordResetEmail(email: email);
          return null;
        } on FirebaseAuthException catch (e) {
          return e.message;
        } catch (e) {
          return 'An Error Has Occured';
        }
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

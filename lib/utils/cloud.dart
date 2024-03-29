import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _cartableCol = _firestore.collection('cartable');
final CollectionReference _usersCollection = _firestore.collection('users');

class CloudDatabase {
  static String? userUid;

  static Future addUser(
      {required Map<String, dynamic> data, required String doc}) async {
    try {
      // final result = await InternetAddress.lookup('google.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      await _usersCollection.doc(doc).set(data).whenComplete(() {
        return;
      }).catchError((e) => e.message);
      // }
    } catch (e) {
      return 'An Error Occured';
    }
  }

  static Future getUserInfo({required String doc}) async {
    try {
      //   final result = await InternetAddress.lookup('google.com');
      //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      _usersCollection.doc(doc).get().then((DocumentSnapshot docSnapshot) {
        if (docSnapshot.exists) {
          Usr user = Usr('', '', '', '', 1, '');
          user.fromMap(
              docSnapshot.id, docSnapshot.data()! as Map<String, dynamic>);
          String rr = user.role;
          setRolePref(rr);
          usrrole = rr;
          return rr;
        } else {}
      });
    } catch (e) {
      return 'An Error Occured';
    }
  }

  static Future addData(
      {required Map<String, dynamic> data, required String col}) async {
    try {
      // final result = await InternetAddress.lookup('google.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      await _firestore.collection(col).doc().set(data).whenComplete(() {
        return;
      }).catchError((e) => e.message);
      // }
    } catch (e) {
      return 'An Error Occured';
    }
  }

  static Future updateData(
      {required Map<String, dynamic> data,
      required String col,
      required String docId}) async {
    try {
      // final result = await InternetAddress.lookup('google.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      await _firestore
          .collection(col)
          .doc(docId)
          .update(data)
          .whenComplete(() => null)
          .catchError((e) => e.message);
      // }
    } catch (e) {
      return 'An Error Occured';
    }
  }

  static Future deleteData({required String col, required String docId}) async {
    try {
      // final result = await InternetAddress.lookup('google.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      await _firestore
          .collection(col)
          .doc(docId)
          .delete()
          .whenComplete(() => null)
          .catchError((e) => e.message);
      // }
    } catch (e) {
      return 'An Error Occured';
    }
  }
}

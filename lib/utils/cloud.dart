import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _cartableCol = _firestore.collection('cartable');
final CollectionReference _usersCollection = _firestore.collection('users');

class CloudDatabase {
  static String? userUid;

  static Future addUser(
      {required Map<String, dynamic> data, required String doc}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _usersCollection.doc(doc).set(data).whenComplete(() {
          return;
        }).catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  static Future addData(
      {required Map<String, dynamic> data, required String col}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _firestore.collection(col).doc().set(data).whenComplete(() {
          return;
        }).catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  static Future updateData(
      {required Map<String, dynamic> data,
      required String col,
      required String docId}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _firestore
            .collection(col)
            .doc(docId)
            .update(data)
            .whenComplete(() => null)
            .catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  static Future deleteData({required String col, required String docId}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _firestore
            .collection(col)
            .doc(docId)
            .delete()
            .whenComplete(() => null)
            .catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }
}

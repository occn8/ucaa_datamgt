import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _tablesCollection = _firestore.collection('tables');
final CollectionReference _usersCollection = _firestore.collection('users');

class CloudDatabase {
  static String? userUid;

  static Future addData({required Map<String, dynamic> data}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _tablesCollection.doc().set(data).whenComplete(() {
          return;
        }).catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

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

  static Future updateData(
      {required Map<String, dynamic> data, required String docId}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _tablesCollection
            .doc(docId)
            .update(data)
            .whenComplete(() => null)
            .catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  static Future deleteData({required String docId}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _tablesCollection
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

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _cartableCol = _firestore.collection('cartable');
final CollectionReference _reachtableCol = _firestore.collection('reachtable');
final CollectionReference _shgtableCol = _firestore.collection('shgtable');
final CollectionReference _widtableCol = _firestore.collection('widtable');
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

  static Future addcarData({required Map<String, dynamic> data}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _cartableCol.doc().set(data).whenComplete(() {
          return;
        }).catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  static Future addreachData({required Map<String, dynamic> data}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _reachtableCol.doc().set(data).whenComplete(() {
          return;
        }).catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  static Future addshgData({required Map<String, dynamic> data}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _shgtableCol.doc().set(data).whenComplete(() {
          return;
        }).catchError((e) => e.message);
      }
    } on SocketException {
      return 'No Internet connection';
    }
  }

  static Future addwidData({required Map<String, dynamic> data}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await _widtableCol.doc().set(data).whenComplete(() {
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
        await _cartableCol
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
        await _cartableCol
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

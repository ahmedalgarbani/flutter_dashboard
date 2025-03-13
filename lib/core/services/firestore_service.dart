import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dashboard/core/services/data_service.dart';

class FirestoreService implements DataServic {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    try {
      CollectionReference products = firestore.collection('Products');
      if (documentId != null) {
        firestore.collection(products.path).doc(documentId).set(data);
      } else {
        await firestore.collection(path).add(data);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>?> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    throw UnimplementedError();
    // if (documentId != null) {
    //   var data = await firestore.collection(path).doc(documentId).get();
    //   return data.data();
    // } else {
    //   Query<Map<String, dynamic>> data = firestore.collection(path);
    //   if (query != null) {
    //     if (query['orderBy'] != null) {
    //       var orderByField = query['orderBy'];
    //       var descending = query['descending'];
    //       data = data.orderBy(orderByField, descending: descending);
    //     }
    //     if (query['limit'] != null) {
    //       var limit = query['limit'];
    //       data = data.limit(limit);
    //     }
    //   }
    //   var result = await data.get();
    //   return result?.docs.map((e) => e.data()).toList()!;
    // }
  }

  @override
  Future<bool> chekIfDataExists(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}

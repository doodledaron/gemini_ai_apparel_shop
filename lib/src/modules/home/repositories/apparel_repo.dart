import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/apparel.dart';
class ApparelRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch all apparels from Firestore
  Future<List<Apparel>> fetchApparels() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('apparels').get();
    return snapshot.docs.map((doc) => Apparel.fromDocument(doc)).toList();
  }

  // Method to add an apparel to Firestore
  Future<void> addApparel(Apparel apparel) async {
    await _firestore.collection('apparels').add(apparel.toDocument());
  }

  // Method to update an apparel in Firestore
  Future<void> updateApparel(Apparel apparel) async {
    await _firestore.collection('apparels').doc(apparel.id).update(apparel.toDocument());
  }

  // Method to delete an apparel from Firestore
  Future<void> deleteApparel(String id) async {
    await _firestore.collection('apparels').doc(id).delete();
  }
}

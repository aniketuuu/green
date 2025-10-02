import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveCarbonCalculation(Map<String, dynamic> data) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await _db.collection('carbon_calculations').add({
      "userId": uid,
      "timestamp": DateTime.now(),
      ...data,
    });
  }

  Future<QuerySnapshot> getUserCalculations() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return await _db
        .collection('carbon_calculations')
        .where('userId', isEqualTo: uid)
        .orderBy('timestamp', descending: true)
        .get();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseExtentionFunction {
  static Future<void> collectionDelete(
      {required CollectionReference collectionRef,
      required FirebaseFirestore firestore}) async {
    WriteBatch batch = firestore.batch();
    QuerySnapshot querySnapshot = await collectionRef.get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }
}

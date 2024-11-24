import 'package:cloud_firestore/cloud_firestore.dart';

class NoteSearvice {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future Notesave(
    Map<String, dynamic> data,
  ) async {
    return await db.collection('note').doc().set(data);
  }

  Future NOteget() async {
    return await db.collection('note').get();
  }
    Future<List<QueryDocumentSnapshot>> noteGet(String usarid) async {
    QuerySnapshot snapshot = await db
        .collection('note',)
        .where('usarid', isEqualTo: usarid)
        .orderBy('time', descending: true)
        .snapshots().first;

    return snapshot.docs;
  }
}

import 'package:firebase_database/firebase_database.dart';

import 'errors.dart';

Future<Map<String, dynamic>> firebaseGet(DatabaseReference ref, String path) async {
  try {
    final snapshot = await ref.child(path).get();
    if (snapshot.exists) {
      return snapshot.value as Map<String, dynamic>;
    } else {
      throw DataNotFoundError();
    }
  } catch (e) {
    throw ServerError();
  }
}

Future<void> firebaseSet(DatabaseReference ref, Map<String, dynamic> value) async {
  try {
    return ref.set(value);
  } catch (e) {
    throw ServerError();
  }
}

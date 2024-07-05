import 'package:cloud_firestore/cloud_firestore.dart';

import 'errors.dart';

Future<Map<String, dynamic>> firebaseGet(DocumentReference docRef) {
  return docRef.get().then((doc) {
    final data = doc.data();
    if (doc.exists && data != null) {
      return data as Map<String, dynamic>;
    } else {
      throw DataNotFoundError();
    }
  }, onError: (e) {
    throw ServerError();
  });
}

Future<void> firebaseSet(DocumentReference docRef, Map<String, dynamic> data) {
  return docRef.set(data).onError((e, _) {
    throw ServerError();
  });
}

Future<String> firebaseAdd(CollectionReference collectionRef, Map<String, dynamic> data) {
  return collectionRef
      .add(data)
      .then(
        (doc) => doc.id,
      )
      .onError(
    (e, _) {
      throw ServerError();
    },
  );
}

Future<void> firebaseUpdate(DocumentReference docRef, Map<String, dynamic> data) {
  return docRef.update(data).onError((e, _) {
    throw ServerError();
  });
}

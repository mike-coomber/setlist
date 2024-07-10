import 'package:cloud_firestore/cloud_firestore.dart';

import '../errors.dart';

Future<T> firebaseGet<T>({
  required DocumentReference<Map<String, dynamic>> docRef,
  required T Function(Map<String, dynamic> data) converter,
}) {
  return docRef.get().then((doc) {
    final data = doc.data();
    if (doc.exists && data != null) {
      return converter(data);
    } else {
      throw DataNotFoundError();
    }
  }, onError: (e) {
    throw ServerError(e.toString());
  });
}

Future<List<T>> firebaseGetMultipleFromQuery<T>({
  required Query<Map<String, dynamic>> query,
  required T Function(Map<String, dynamic> data) converter,
}) async {
  try {
    return parseDocs(
      docs: (await query.get()).docs,
      converter: converter,
    );
  } catch (e) {
    throw ServerError(e.toString());
  }
}

List<T> parseDocs<T>({
  required List<DocumentSnapshot<Map<String, dynamic>>> docs,
  required T Function(Map<String, dynamic> data) converter,
}) {
  return docs.map(
    (doc) {
      if (doc.data() == null) throw ServerError('Document data is null');
      return converter(doc.data()!);
    },
  ).toList();
}

Future<void> firebaseSet({
  required DocumentReference docRef,
  required Map<String, dynamic> data,
}) {
  return docRef.set(data).onError((e, _) {
    throw ServerError(e.toString());
  });
}

Future<String> firebaseAdd({
  required CollectionReference collectionRef,
  required Map<String, dynamic> data,
}) {
  return collectionRef
      .add(data)
      .then(
        (doc) => doc.id,
      )
      .onError(
    (e, _) {
      throw ServerError(e.toString());
    },
  );
}

Future<void> firebaseUpdate({
  required DocumentReference docRef,
  required Map<String, dynamic> data,
}) {
  return docRef.update(data).onError((e, _) {
    throw ServerError(e.toString());
  });
}

Future<void> firebaseDelete({
  required DocumentReference docRef,
}) async {
  return docRef.delete().onError((e, _) {
    throw ServerError(e.toString());
  });
}

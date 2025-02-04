import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "person" field.
  DocumentReference? _person;
  DocumentReference? get person => _person;
  bool hasPerson() => _person != null;

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "Comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "Reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  bool hasReply() => _reply != null;

  // "commentID" field.
  DocumentReference? _commentID;
  DocumentReference? get commentID => _commentID;
  bool hasCommentID() => _commentID != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _seen = snapshotData['seen'] as bool?;
    _person = snapshotData['person'] as DocumentReference?;
    _post = snapshotData['post'] as DocumentReference?;
    _comment = snapshotData['Comment'] as String?;
    _reply = snapshotData['Reply'] as String?;
    _commentID = snapshotData['commentID'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notification')
          : FirebaseFirestore.instance.collectionGroup('notification');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notification').doc(id);

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? type,
  bool? seen,
  DocumentReference? person,
  DocumentReference? post,
  String? comment,
  String? reply,
  DocumentReference? commentID,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'seen': seen,
      'person': person,
      'post': post,
      'Comment': comment,
      'Reply': reply,
      'commentID': commentID,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.seen == e2?.seen &&
        e1?.person == e2?.person &&
        e1?.post == e2?.post &&
        e1?.comment == e2?.comment &&
        e1?.reply == e2?.reply &&
        e1?.commentID == e2?.commentID &&
        e1?.time == e2?.time;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.type,
        e?.seen,
        e?.person,
        e?.post,
        e?.comment,
        e?.reply,
        e?.commentID,
        e?.time
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}

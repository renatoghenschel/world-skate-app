import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepliesRecord extends FirestoreRecord {
  RepliesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comment" field.
  DocumentReference? _comment;
  DocumentReference? get comment => _comment;
  bool hasComment() => _comment != null;

  // "replyText" field.
  String? _replyText;
  String get replyText => _replyText ?? '';
  bool hasReplyText() => _replyText != null;

  // "replyUser" field.
  DocumentReference? _replyUser;
  DocumentReference? get replyUser => _replyUser;
  bool hasReplyUser() => _replyUser != null;

  // "replyUserName" field.
  String? _replyUserName;
  String get replyUserName => _replyUserName ?? '';
  bool hasReplyUserName() => _replyUserName != null;

  // "replyUserImage" field.
  String? _replyUserImage;
  String get replyUserImage => _replyUserImage ?? '';
  bool hasReplyUserImage() => _replyUserImage != null;

  // "userLikes" field.
  List<DocumentReference>? _userLikes;
  List<DocumentReference> get userLikes => _userLikes ?? const [];
  bool hasUserLikes() => _userLikes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comment = snapshotData['comment'] as DocumentReference?;
    _replyText = snapshotData['replyText'] as String?;
    _replyUser = snapshotData['replyUser'] as DocumentReference?;
    _replyUserName = snapshotData['replyUserName'] as String?;
    _replyUserImage = snapshotData['replyUserImage'] as String?;
    _userLikes = getDataList(snapshotData['userLikes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('replies')
          : FirebaseFirestore.instance.collectionGroup('replies');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('replies').doc(id);

  static Stream<RepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepliesRecord.fromSnapshot(s));

  static Future<RepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepliesRecord.fromSnapshot(s));

  static RepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepliesRecordData({
  DocumentReference? comment,
  String? replyText,
  DocumentReference? replyUser,
  String? replyUserName,
  String? replyUserImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'replyText': replyText,
      'replyUser': replyUser,
      'replyUserName': replyUserName,
      'replyUserImage': replyUserImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepliesRecordDocumentEquality implements Equality<RepliesRecord> {
  const RepliesRecordDocumentEquality();

  @override
  bool equals(RepliesRecord? e1, RepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.comment == e2?.comment &&
        e1?.replyText == e2?.replyText &&
        e1?.replyUser == e2?.replyUser &&
        e1?.replyUserName == e2?.replyUserName &&
        e1?.replyUserImage == e2?.replyUserImage &&
        listEquality.equals(e1?.userLikes, e2?.userLikes);
  }

  @override
  int hash(RepliesRecord? e) => const ListEquality().hash([
        e?.comment,
        e?.replyText,
        e?.replyUser,
        e?.replyUserName,
        e?.replyUserImage,
        e?.userLikes
      ]);

  @override
  bool isValidKey(Object? o) => o is RepliesRecord;
}

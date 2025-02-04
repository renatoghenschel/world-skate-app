import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "commentUser" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "commentText" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "commentUserName" field.
  String? _commentUserName;
  String get commentUserName => _commentUserName ?? '';
  bool hasCommentUserName() => _commentUserName != null;

  // "commentUserImage" field.
  String? _commentUserImage;
  String get commentUserImage => _commentUserImage ?? '';
  bool hasCommentUserImage() => _commentUserImage != null;

  // "commentLikes" field.
  List<DocumentReference>? _commentLikes;
  List<DocumentReference> get commentLikes => _commentLikes ?? const [];
  bool hasCommentLikes() => _commentLikes != null;

  // "commentReplies" field.
  List<DocumentReference>? _commentReplies;
  List<DocumentReference> get commentReplies => _commentReplies ?? const [];
  bool hasCommentReplies() => _commentReplies != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentUser = snapshotData['commentUser'] as DocumentReference?;
    _commentText = snapshotData['commentText'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _commentUserName = snapshotData['commentUserName'] as String?;
    _commentUserImage = snapshotData['commentUserImage'] as String?;
    _commentLikes = getDataList(snapshotData['commentLikes']);
    _commentReplies = getDataList(snapshotData['commentReplies']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? commentUser,
  String? commentText,
  DateTime? createdTime,
  String? commentUserName,
  String? commentUserImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'commentUser': commentUser,
      'commentText': commentText,
      'createdTime': createdTime,
      'commentUserName': commentUserName,
      'commentUserImage': commentUserImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentUser == e2?.commentUser &&
        e1?.commentText == e2?.commentText &&
        e1?.createdTime == e2?.createdTime &&
        e1?.commentUserName == e2?.commentUserName &&
        e1?.commentUserImage == e2?.commentUserImage &&
        listEquality.equals(e1?.commentLikes, e2?.commentLikes) &&
        listEquality.equals(e1?.commentReplies, e2?.commentReplies);
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentUser,
        e?.commentText,
        e?.createdTime,
        e?.commentUserName,
        e?.commentUserImage,
        e?.commentLikes,
        e?.commentReplies
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}

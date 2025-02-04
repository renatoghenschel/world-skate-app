import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvaliationsRecord extends FirestoreRecord {
  AvaliationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "avaliationUser" field.
  DocumentReference? _avaliationUser;
  DocumentReference? get avaliationUser => _avaliationUser;
  bool hasAvaliationUser() => _avaliationUser != null;

  // "avaliationText" field.
  String? _avaliationText;
  String get avaliationText => _avaliationText ?? '';
  bool hasAvaliationText() => _avaliationText != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "avaliationUserName" field.
  String? _avaliationUserName;
  String get avaliationUserName => _avaliationUserName ?? '';
  bool hasAvaliationUserName() => _avaliationUserName != null;

  // "avaliationUserImage" field.
  String? _avaliationUserImage;
  String get avaliationUserImage => _avaliationUserImage ?? '';
  bool hasAvaliationUserImage() => _avaliationUserImage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _avaliationUser = snapshotData['avaliationUser'] as DocumentReference?;
    _avaliationText = snapshotData['avaliationText'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _avaliationUserName = snapshotData['avaliationUserName'] as String?;
    _avaliationUserImage = snapshotData['avaliationUserImage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('avaliations')
          : FirebaseFirestore.instance.collectionGroup('avaliations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('avaliations').doc(id);

  static Stream<AvaliationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvaliationsRecord.fromSnapshot(s));

  static Future<AvaliationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvaliationsRecord.fromSnapshot(s));

  static AvaliationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvaliationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvaliationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvaliationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvaliationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvaliationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvaliationsRecordData({
  DocumentReference? avaliationUser,
  String? avaliationText,
  DateTime? createdTime,
  String? avaliationUserName,
  String? avaliationUserImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'avaliationUser': avaliationUser,
      'avaliationText': avaliationText,
      'createdTime': createdTime,
      'avaliationUserName': avaliationUserName,
      'avaliationUserImage': avaliationUserImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvaliationsRecordDocumentEquality implements Equality<AvaliationsRecord> {
  const AvaliationsRecordDocumentEquality();

  @override
  bool equals(AvaliationsRecord? e1, AvaliationsRecord? e2) {
    return e1?.avaliationUser == e2?.avaliationUser &&
        e1?.avaliationText == e2?.avaliationText &&
        e1?.createdTime == e2?.createdTime &&
        e1?.avaliationUserName == e2?.avaliationUserName &&
        e1?.avaliationUserImage == e2?.avaliationUserImage;
  }

  @override
  int hash(AvaliationsRecord? e) => const ListEquality().hash([
        e?.avaliationUser,
        e?.avaliationText,
        e?.createdTime,
        e?.avaliationUserName,
        e?.avaliationUserImage
      ]);

  @override
  bool isValidKey(Object? o) => o is AvaliationsRecord;
}

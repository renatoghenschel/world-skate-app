import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "senderID" field.
  DocumentReference? _senderID;
  DocumentReference? get senderID => _senderID;
  bool hasSenderID() => _senderID != null;

  // "senderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "senderImage" field.
  String? _senderImage;
  String get senderImage => _senderImage ?? '';
  bool hasSenderImage() => _senderImage != null;

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "messageImage" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  bool hasMessageImage() => _messageImage != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "ts" field.
  DateTime? _ts;
  DateTime? get ts => _ts;
  bool hasTs() => _ts != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _senderID = snapshotData['senderID'] as DocumentReference?;
    _senderName = snapshotData['senderName'] as String?;
    _senderImage = snapshotData['senderImage'] as String?;
    _messageText = snapshotData['messageText'] as String?;
    _messageImage = snapshotData['messageImage'] as String?;
    _audio = snapshotData['audio'] as String?;
    _ts = snapshotData['ts'] as DateTime?;
    _type = snapshotData['type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? senderID,
  String? senderName,
  String? senderImage,
  String? messageText,
  String? messageImage,
  String? audio,
  DateTime? ts,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderID': senderID,
      'senderName': senderName,
      'senderImage': senderImage,
      'messageText': messageText,
      'messageImage': messageImage,
      'audio': audio,
      'ts': ts,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.senderID == e2?.senderID &&
        e1?.senderName == e2?.senderName &&
        e1?.senderImage == e2?.senderImage &&
        e1?.messageText == e2?.messageText &&
        e1?.messageImage == e2?.messageImage &&
        e1?.audio == e2?.audio &&
        e1?.ts == e2?.ts &&
        e1?.type == e2?.type;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.senderID,
        e?.senderName,
        e?.senderImage,
        e?.messageText,
        e?.messageImage,
        e?.audio,
        e?.ts,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}

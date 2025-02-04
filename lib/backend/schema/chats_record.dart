import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "participantsImages" field.
  List<String>? _participantsImages;
  List<String> get participantsImages => _participantsImages ?? const [];
  bool hasParticipantsImages() => _participantsImages != null;

  // "participantsNames" field.
  List<String>? _participantsNames;
  List<String> get participantsNames => _participantsNames ?? const [];
  bool hasParticipantsNames() => _participantsNames != null;

  // "participantsID" field.
  List<DocumentReference>? _participantsID;
  List<DocumentReference> get participantsID => _participantsID ?? const [];
  bool hasParticipantsID() => _participantsID != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageTS" field.
  DateTime? _lastMessageTS;
  DateTime? get lastMessageTS => _lastMessageTS;
  bool hasLastMessageTS() => _lastMessageTS != null;

  // "lastMessageImage" field.
  String? _lastMessageImage;
  String get lastMessageImage => _lastMessageImage ?? '';
  bool hasLastMessageImage() => _lastMessageImage != null;

  // "lastMessageAudio" field.
  String? _lastMessageAudio;
  String get lastMessageAudio => _lastMessageAudio ?? '';
  bool hasLastMessageAudio() => _lastMessageAudio != null;

  // "lastMessageType" field.
  String? _lastMessageType;
  String get lastMessageType => _lastMessageType ?? '';
  bool hasLastMessageType() => _lastMessageType != null;

  void _initializeFields() {
    _participantsImages = getDataList(snapshotData['participantsImages']);
    _participantsNames = getDataList(snapshotData['participantsNames']);
    _participantsID = getDataList(snapshotData['participantsID']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastMessageTS = snapshotData['lastMessageTS'] as DateTime?;
    _lastMessageImage = snapshotData['lastMessageImage'] as String?;
    _lastMessageAudio = snapshotData['lastMessageAudio'] as String?;
    _lastMessageType = snapshotData['lastMessageType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTS,
  String? lastMessageImage,
  String? lastMessageAudio,
  String? lastMessageType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'lastMessageTS': lastMessageTS,
      'lastMessageImage': lastMessageImage,
      'lastMessageAudio': lastMessageAudio,
      'lastMessageType': lastMessageType,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.participantsImages, e2?.participantsImages) &&
        listEquality.equals(e1?.participantsNames, e2?.participantsNames) &&
        listEquality.equals(e1?.participantsID, e2?.participantsID) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTS == e2?.lastMessageTS &&
        e1?.lastMessageImage == e2?.lastMessageImage &&
        e1?.lastMessageAudio == e2?.lastMessageAudio &&
        e1?.lastMessageType == e2?.lastMessageType;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.participantsImages,
        e?.participantsNames,
        e?.participantsID,
        e?.lastMessage,
        e?.lastMessageTS,
        e?.lastMessageImage,
        e?.lastMessageAudio,
        e?.lastMessageType
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}

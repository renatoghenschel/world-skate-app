import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatInvitationRecord extends FirestoreRecord {
  ChatInvitationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "rejected" field.
  bool? _rejected;
  bool get rejected => _rejected ?? false;
  bool hasRejected() => _rejected != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _accepted = snapshotData['accepted'] as bool?;
    _rejected = snapshotData['rejected'] as bool?;
    _state = snapshotData['state'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatInvitation')
          : FirebaseFirestore.instance.collectionGroup('chatInvitation');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chatInvitation').doc(id);

  static Stream<ChatInvitationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatInvitationRecord.fromSnapshot(s));

  static Future<ChatInvitationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatInvitationRecord.fromSnapshot(s));

  static ChatInvitationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatInvitationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatInvitationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatInvitationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatInvitationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatInvitationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatInvitationRecordData({
  DocumentReference? sender,
  DateTime? time,
  bool? accepted,
  bool? rejected,
  String? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'time': time,
      'accepted': accepted,
      'rejected': rejected,
      'state': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatInvitationRecordDocumentEquality
    implements Equality<ChatInvitationRecord> {
  const ChatInvitationRecordDocumentEquality();

  @override
  bool equals(ChatInvitationRecord? e1, ChatInvitationRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.time == e2?.time &&
        e1?.accepted == e2?.accepted &&
        e1?.rejected == e2?.rejected &&
        e1?.state == e2?.state;
  }

  @override
  int hash(ChatInvitationRecord? e) => const ListEquality()
      .hash([e?.sender, e?.time, e?.accepted, e?.rejected, e?.state]);

  @override
  bool isValidKey(Object? o) => o is ChatInvitationRecord;
}

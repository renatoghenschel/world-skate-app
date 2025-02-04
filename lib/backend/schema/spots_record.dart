import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpotsRecord extends FirestoreRecord {
  SpotsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nomeSpot" field.
  String? _nomeSpot;
  String get nomeSpot => _nomeSpot ?? '';
  bool hasNomeSpot() => _nomeSpot != null;

  // "descSpot" field.
  String? _descSpot;
  String get descSpot => _descSpot ?? '';
  bool hasDescSpot() => _descSpot != null;

  // "fotoSpot" field.
  String? _fotoSpot;
  String get fotoSpot => _fotoSpot ?? '';
  bool hasFotoSpot() => _fotoSpot != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "local" field.
  LatLng? _local;
  LatLng? get local => _local;
  bool hasLocal() => _local != null;

  // "avaliacao" field.
  double? _avaliacao;
  double get avaliacao => _avaliacao ?? 0.0;
  bool hasAvaliacao() => _avaliacao != null;

  // "spotUser" field.
  DocumentReference? _spotUser;
  DocumentReference? get spotUser => _spotUser;
  bool hasSpotUser() => _spotUser != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  void _initializeFields() {
    _nomeSpot = snapshotData['nomeSpot'] as String?;
    _descSpot = snapshotData['descSpot'] as String?;
    _fotoSpot = snapshotData['fotoSpot'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _local = snapshotData['local'] as LatLng?;
    _avaliacao = castToType<double>(snapshotData['avaliacao']);
    _spotUser = snapshotData['spotUser'] as DocumentReference?;
    _endereco = snapshotData['endereco'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('spots');

  static Stream<SpotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpotsRecord.fromSnapshot(s));

  static Future<SpotsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpotsRecord.fromSnapshot(s));

  static SpotsRecord fromSnapshot(DocumentSnapshot snapshot) => SpotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpotsRecordData({
  String? nomeSpot,
  String? descSpot,
  String? fotoSpot,
  String? cidade,
  LatLng? local,
  double? avaliacao,
  DocumentReference? spotUser,
  String? endereco,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeSpot': nomeSpot,
      'descSpot': descSpot,
      'fotoSpot': fotoSpot,
      'cidade': cidade,
      'local': local,
      'avaliacao': avaliacao,
      'spotUser': spotUser,
      'endereco': endereco,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpotsRecordDocumentEquality implements Equality<SpotsRecord> {
  const SpotsRecordDocumentEquality();

  @override
  bool equals(SpotsRecord? e1, SpotsRecord? e2) {
    return e1?.nomeSpot == e2?.nomeSpot &&
        e1?.descSpot == e2?.descSpot &&
        e1?.fotoSpot == e2?.fotoSpot &&
        e1?.cidade == e2?.cidade &&
        e1?.local == e2?.local &&
        e1?.avaliacao == e2?.avaliacao &&
        e1?.spotUser == e2?.spotUser &&
        e1?.endereco == e2?.endereco;
  }

  @override
  int hash(SpotsRecord? e) => const ListEquality().hash([
        e?.nomeSpot,
        e?.descSpot,
        e?.fotoSpot,
        e?.cidade,
        e?.local,
        e?.avaliacao,
        e?.spotUser,
        e?.endereco
      ]);

  @override
  bool isValidKey(Object? o) => o is SpotsRecord;
}

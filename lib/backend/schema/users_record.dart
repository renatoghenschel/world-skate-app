import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "pendingFriends" field.
  List<DocumentReference>? _pendingFriends;
  List<DocumentReference> get pendingFriends => _pendingFriends ?? const [];
  bool hasPendingFriends() => _pendingFriends != null;

  // "blockedUser" field.
  List<DocumentReference>? _blockedUser;
  List<DocumentReference> get blockedUser => _blockedUser ?? const [];
  bool hasBlockedUser() => _blockedUser != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userName = snapshotData['userName'] as String?;
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _friends = getDataList(snapshotData['friends']);
    _pendingFriends = getDataList(snapshotData['pendingFriends']);
    _blockedUser = getDataList(snapshotData['blockedUser']);
    _bio = snapshotData['bio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userName,
  String? bio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userName': userName,
      'bio': bio,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userName == e2?.userName &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        listEquality.equals(e1?.pendingFriends, e2?.pendingFriends) &&
        listEquality.equals(e1?.blockedUser, e2?.blockedUser) &&
        e1?.bio == e2?.bio;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userName,
        e?.followers,
        e?.following,
        e?.friends,
        e?.pendingFriends,
        e?.blockedUser,
        e?.bio
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

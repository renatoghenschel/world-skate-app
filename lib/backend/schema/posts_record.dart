import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "postimage" field.
  String? _postimage;
  String get postimage => _postimage ?? '';
  bool hasPostimage() => _postimage != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "postUserName" field.
  String? _postUserName;
  String get postUserName => _postUserName ?? '';
  bool hasPostUserName() => _postUserName != null;

  // "postUserImage" field.
  String? _postUserImage;
  String get postUserImage => _postUserImage ?? '';
  bool hasPostUserImage() => _postUserImage != null;

  // "userLikes" field.
  List<DocumentReference>? _userLikes;
  List<DocumentReference> get userLikes => _userLikes ?? const [];
  bool hasUserLikes() => _userLikes != null;

  // "userBookmarks" field.
  List<DocumentReference>? _userBookmarks;
  List<DocumentReference> get userBookmarks => _userBookmarks ?? const [];
  bool hasUserBookmarks() => _userBookmarks != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "comments" field.
  int? _comments;
  int get comments => _comments ?? 0;
  bool hasComments() => _comments != null;

  // "posterName" field.
  String? _posterName;
  String get posterName => _posterName ?? '';
  bool hasPosterName() => _posterName != null;

  // "postVideo" field.
  String? _postVideo;
  String get postVideo => _postVideo ?? '';
  bool hasPostVideo() => _postVideo != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _postimage = snapshotData['postimage'] as String?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _postText = snapshotData['postText'] as String?;
    _postUserName = snapshotData['postUserName'] as String?;
    _postUserImage = snapshotData['postUserImage'] as String?;
    _userLikes = getDataList(snapshotData['userLikes']);
    _userBookmarks = getDataList(snapshotData['userBookmarks']);
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _comments = castToType<int>(snapshotData['comments']);
    _posterName = snapshotData['posterName'] as String?;
    _postVideo = snapshotData['postVideo'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postimage,
  DocumentReference? postUser,
  String? postText,
  String? postUserName,
  String? postUserImage,
  DateTime? createdTime,
  int? comments,
  String? posterName,
  String? postVideo,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postimage': postimage,
      'postUser': postUser,
      'postText': postText,
      'postUserName': postUserName,
      'postUserImage': postUserImage,
      'createdTime': createdTime,
      'comments': comments,
      'posterName': posterName,
      'postVideo': postVideo,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postimage == e2?.postimage &&
        e1?.postUser == e2?.postUser &&
        e1?.postText == e2?.postText &&
        e1?.postUserName == e2?.postUserName &&
        e1?.postUserImage == e2?.postUserImage &&
        listEquality.equals(e1?.userLikes, e2?.userLikes) &&
        listEquality.equals(e1?.userBookmarks, e2?.userBookmarks) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.comments == e2?.comments &&
        e1?.posterName == e2?.posterName &&
        e1?.postVideo == e2?.postVideo &&
        e1?.type == e2?.type;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postimage,
        e?.postUser,
        e?.postText,
        e?.postUserName,
        e?.postUserImage,
        e?.userLikes,
        e?.userBookmarks,
        e?.createdTime,
        e?.comments,
        e?.posterName,
        e?.postVideo,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}

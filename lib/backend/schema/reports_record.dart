import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "issue_name" field.
  String? _issueName;
  String get issueName => _issueName ?? '';
  bool hasIssueName() => _issueName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "video_path" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _issueName = snapshotData['issue_name'] as String?;
    _description = snapshotData['description'] as String?;
    _imagePath = snapshotData['image_path'] as String?;
    _videoPath = snapshotData['video_path'] as String?;
    _location = snapshotData['location'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? issueName,
  String? description,
  String? imagePath,
  String? videoPath,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'issue_name': issueName,
      'description': description,
      'image_path': imagePath,
      'video_path': videoPath,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.issueName == e2?.issueName &&
        e1?.description == e2?.description &&
        e1?.imagePath == e2?.imagePath &&
        e1?.videoPath == e2?.videoPath &&
        e1?.location == e2?.location;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash(
      [e?.issueName, e?.description, e?.imagePath, e?.videoPath, e?.location]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}

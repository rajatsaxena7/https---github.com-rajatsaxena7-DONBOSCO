import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RaiseissueRecord extends FirestoreRecord {
  RaiseissueRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "raiseiissue" field.
  String? _raiseiissue;
  String get raiseiissue => _raiseiissue ?? '';
  bool hasRaiseiissue() => _raiseiissue != null;

  // "issoolved" field.
  bool? _issoolved;
  bool get issoolved => _issoolved ?? false;
  bool hasIssoolved() => _issoolved != null;

  void _initializeFields() {
    _userref = snapshotData['userref'] as DocumentReference?;
    _raiseiissue = snapshotData['raiseiissue'] as String?;
    _issoolved = snapshotData['issoolved'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('raiseissue');

  static Stream<RaiseissueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RaiseissueRecord.fromSnapshot(s));

  static Future<RaiseissueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RaiseissueRecord.fromSnapshot(s));

  static RaiseissueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RaiseissueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RaiseissueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RaiseissueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RaiseissueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RaiseissueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRaiseissueRecordData({
  DocumentReference? userref,
  String? raiseiissue,
  bool? issoolved,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userref': userref,
      'raiseiissue': raiseiissue,
      'issoolved': issoolved,
    }.withoutNulls,
  );

  return firestoreData;
}

class RaiseissueRecordDocumentEquality implements Equality<RaiseissueRecord> {
  const RaiseissueRecordDocumentEquality();

  @override
  bool equals(RaiseissueRecord? e1, RaiseissueRecord? e2) {
    return e1?.userref == e2?.userref &&
        e1?.raiseiissue == e2?.raiseiissue &&
        e1?.issoolved == e2?.issoolved;
  }

  @override
  int hash(RaiseissueRecord? e) =>
      const ListEquality().hash([e?.userref, e?.raiseiissue, e?.issoolved]);

  @override
  bool isValidKey(Object? o) => o is RaiseissueRecord;
}

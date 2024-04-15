import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "categoryname" field.
  String? _categoryname;
  String get categoryname => _categoryname ?? '';
  bool hasCategoryname() => _categoryname != null;

  // "categoryImage" field.
  String? _categoryImage;
  String get categoryImage => _categoryImage ?? '';
  bool hasCategoryImage() => _categoryImage != null;

  void _initializeFields() {
    _categoryname = snapshotData['categoryname'] as String?;
    _categoryImage = snapshotData['categoryImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryname,
  String? categoryImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryname': categoryname,
      'categoryImage': categoryImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryname == e2?.categoryname &&
        e1?.categoryImage == e2?.categoryImage;
  }

  @override
  int hash(CategoriesRecord? e) =>
      const ListEquality().hash([e?.categoryname, e?.categoryImage]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}

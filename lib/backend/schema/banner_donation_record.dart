import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BannerDonationRecord extends FirestoreRecord {
  BannerDonationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _imageUrl = snapshotData['image_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BannerDonation');

  static Stream<BannerDonationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannerDonationRecord.fromSnapshot(s));

  static Future<BannerDonationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannerDonationRecord.fromSnapshot(s));

  static BannerDonationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannerDonationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannerDonationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannerDonationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannerDonationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannerDonationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannerDonationRecordData({
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image_url': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannerDonationRecordDocumentEquality
    implements Equality<BannerDonationRecord> {
  const BannerDonationRecordDocumentEquality();

  @override
  bool equals(BannerDonationRecord? e1, BannerDonationRecord? e2) {
    return e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(BannerDonationRecord? e) => const ListEquality().hash([e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is BannerDonationRecord;
}

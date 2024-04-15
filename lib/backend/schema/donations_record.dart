import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DonationsRecord extends FirestoreRecord {
  DonationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "donationID" field.
  int? _donationID;
  int get donationID => _donationID ?? 0;
  bool hasDonationID() => _donationID != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "campaignID" field.
  DocumentReference? _campaignID;
  DocumentReference? get campaignID => _campaignID;
  bool hasCampaignID() => _campaignID != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "donationDate" field.
  DateTime? _donationDate;
  DateTime? get donationDate => _donationDate;
  bool hasDonationDate() => _donationDate != null;

  // "anonymous" field.
  bool? _anonymous;
  bool get anonymous => _anonymous ?? false;
  bool hasAnonymous() => _anonymous != null;

  void _initializeFields() {
    _donationID = castToType<int>(snapshotData['donationID']);
    _userId = snapshotData['userId'] as DocumentReference?;
    _campaignID = snapshotData['campaignID'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _donationDate = snapshotData['donationDate'] as DateTime?;
    _anonymous = snapshotData['anonymous'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Donations');

  static Stream<DonationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DonationsRecord.fromSnapshot(s));

  static Future<DonationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DonationsRecord.fromSnapshot(s));

  static DonationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DonationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DonationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DonationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DonationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DonationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDonationsRecordData({
  int? donationID,
  DocumentReference? userId,
  DocumentReference? campaignID,
  double? amount,
  DateTime? donationDate,
  bool? anonymous,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'donationID': donationID,
      'userId': userId,
      'campaignID': campaignID,
      'amount': amount,
      'donationDate': donationDate,
      'anonymous': anonymous,
    }.withoutNulls,
  );

  return firestoreData;
}

class DonationsRecordDocumentEquality implements Equality<DonationsRecord> {
  const DonationsRecordDocumentEquality();

  @override
  bool equals(DonationsRecord? e1, DonationsRecord? e2) {
    return e1?.donationID == e2?.donationID &&
        e1?.userId == e2?.userId &&
        e1?.campaignID == e2?.campaignID &&
        e1?.amount == e2?.amount &&
        e1?.donationDate == e2?.donationDate &&
        e1?.anonymous == e2?.anonymous;
  }

  @override
  int hash(DonationsRecord? e) => const ListEquality().hash([
        e?.donationID,
        e?.userId,
        e?.campaignID,
        e?.amount,
        e?.donationDate,
        e?.anonymous
      ]);

  @override
  bool isValidKey(Object? o) => o is DonationsRecord;
}

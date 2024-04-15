import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDonationRecord extends FirestoreRecord {
  UserDonationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "donationId" field.
  DocumentReference? _donationId;
  DocumentReference? get donationId => _donationId;
  bool hasDonationId() => _donationId != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _donationId = snapshotData['donationId'] as DocumentReference?;
    _campaignID = snapshotData['campaignID'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _donationDate = snapshotData['donationDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userDonation')
          : FirebaseFirestore.instance.collectionGroup('userDonation');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userDonation').doc(id);

  static Stream<UserDonationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDonationRecord.fromSnapshot(s));

  static Future<UserDonationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDonationRecord.fromSnapshot(s));

  static UserDonationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDonationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDonationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDonationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDonationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDonationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDonationRecordData({
  DocumentReference? donationId,
  DocumentReference? campaignID,
  double? amount,
  DateTime? donationDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'donationId': donationId,
      'campaignID': campaignID,
      'amount': amount,
      'donationDate': donationDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDonationRecordDocumentEquality
    implements Equality<UserDonationRecord> {
  const UserDonationRecordDocumentEquality();

  @override
  bool equals(UserDonationRecord? e1, UserDonationRecord? e2) {
    return e1?.donationId == e2?.donationId &&
        e1?.campaignID == e2?.campaignID &&
        e1?.amount == e2?.amount &&
        e1?.donationDate == e2?.donationDate;
  }

  @override
  int hash(UserDonationRecord? e) => const ListEquality()
      .hash([e?.donationId, e?.campaignID, e?.amount, e?.donationDate]);

  @override
  bool isValidKey(Object? o) => o is UserDonationRecord;
}

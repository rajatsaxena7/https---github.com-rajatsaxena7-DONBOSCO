import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampaignsRecord extends FirestoreRecord {
  CampaignsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "campaignid" field.
  int? _campaignid;
  int get campaignid => _campaignid ?? 0;
  bool hasCampaignid() => _campaignid != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "minimumDonation" field.
  double? _minimumDonation;
  double get minimumDonation => _minimumDonation ?? 0.0;
  bool hasMinimumDonation() => _minimumDonation != null;

  // "totalDonations" field.
  double? _totalDonations;
  double get totalDonations => _totalDonations ?? 0.0;
  bool hasTotalDonations() => _totalDonations != null;

  // "goalAmount" field.
  double? _goalAmount;
  double get goalAmount => _goalAmount ?? 0.0;
  bool hasGoalAmount() => _goalAmount != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "campaignImages" field.
  List<String>? _campaignImages;
  List<String> get campaignImages => _campaignImages ?? const [];
  bool hasCampaignImages() => _campaignImages != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "tags1" field.
  String? _tags1;
  String get tags1 => _tags1 ?? '';
  bool hasTags1() => _tags1 != null;

  // "tags2" field.
  String? _tags2;
  String get tags2 => _tags2 ?? '';
  bool hasTags2() => _tags2 != null;

  // "highPriority" field.
  bool? _highPriority;
  bool get highPriority => _highPriority ?? false;
  bool hasHighPriority() => _highPriority != null;

  // "videourl" field.
  String? _videourl;
  String get videourl => _videourl ?? '';
  bool hasVideourl() => _videourl != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _campaignid = castToType<int>(snapshotData['campaignid']);
    _title = snapshotData['title'] as String?;
    _minimumDonation = castToType<double>(snapshotData['minimumDonation']);
    _totalDonations = castToType<double>(snapshotData['totalDonations']);
    _goalAmount = castToType<double>(snapshotData['goalAmount']);
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _campaignImages = getDataList(snapshotData['campaignImages']);
    _status = snapshotData['status'] as bool?;
    _tags1 = snapshotData['tags1'] as String?;
    _tags2 = snapshotData['tags2'] as String?;
    _highPriority = snapshotData['highPriority'] as bool?;
    _videourl = snapshotData['videourl'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('campaigns');

  static Stream<CampaignsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampaignsRecord.fromSnapshot(s));

  static Future<CampaignsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CampaignsRecord.fromSnapshot(s));

  static CampaignsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CampaignsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampaignsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampaignsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampaignsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampaignsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampaignsRecordData({
  double? amount,
  String? description,
  String? imageUrl,
  DateTime? createdTime,
  int? campaignid,
  String? title,
  double? minimumDonation,
  double? totalDonations,
  double? goalAmount,
  DateTime? startDate,
  DateTime? endDate,
  bool? status,
  String? tags1,
  String? tags2,
  bool? highPriority,
  String? videourl,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'description': description,
      'image_url': imageUrl,
      'created_time': createdTime,
      'campaignid': campaignid,
      'title': title,
      'minimumDonation': minimumDonation,
      'totalDonations': totalDonations,
      'goalAmount': goalAmount,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
      'tags1': tags1,
      'tags2': tags2,
      'highPriority': highPriority,
      'videourl': videourl,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampaignsRecordDocumentEquality implements Equality<CampaignsRecord> {
  const CampaignsRecordDocumentEquality();

  @override
  bool equals(CampaignsRecord? e1, CampaignsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.amount == e2?.amount &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.campaignid == e2?.campaignid &&
        e1?.title == e2?.title &&
        e1?.minimumDonation == e2?.minimumDonation &&
        e1?.totalDonations == e2?.totalDonations &&
        e1?.goalAmount == e2?.goalAmount &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        listEquality.equals(e1?.campaignImages, e2?.campaignImages) &&
        e1?.status == e2?.status &&
        e1?.tags1 == e2?.tags1 &&
        e1?.tags2 == e2?.tags2 &&
        e1?.highPriority == e2?.highPriority &&
        e1?.videourl == e2?.videourl &&
        e1?.category == e2?.category;
  }

  @override
  int hash(CampaignsRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.description,
        e?.imageUrl,
        e?.createdTime,
        e?.campaignid,
        e?.title,
        e?.minimumDonation,
        e?.totalDonations,
        e?.goalAmount,
        e?.startDate,
        e?.endDate,
        e?.campaignImages,
        e?.status,
        e?.tags1,
        e?.tags2,
        e?.highPriority,
        e?.videourl,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is CampaignsRecord;
}

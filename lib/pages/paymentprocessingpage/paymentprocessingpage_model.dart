import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'paymentprocessingpage_widget.dart' show PaymentprocessingpageWidget;
import 'package:flutter/material.dart';

class PaymentprocessingpageModel
    extends FlutterFlowModel<PaymentprocessingpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - paypalauth1] action in paymentprocessingpage widget.
  String? authtoken;
  // Stores action output result for [Custom Action - payid] action in paymentprocessingpage widget.
  String? payid;
  // Stores action output result for [Custom Action - payerID] action in paymentprocessingpage widget.
  String? payerid;
  // Stores action output result for [Backend Call - API (paymentapi)] action in paymentprocessingpage widget.
  ApiCallResponse? apiResultcit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
  }
}

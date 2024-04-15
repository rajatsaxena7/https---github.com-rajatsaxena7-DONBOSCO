import '/flutter_flow/flutter_flow_util.dart';
import 'paymentpage_widget.dart' show PaymentpageWidget;
import 'package:flutter/material.dart';

class PaymentpageModel extends FlutterFlowModel<PaymentpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - paypalauth1] action in Button widget.
  String? authcode;
  // Stores action output result for [Custom Action - payapii] action in Button widget.
  dynamic jsondata;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'donate_widget.dart' show DonateWidget;
import 'package:flutter/material.dart';

class DonateModel extends FlutterFlowModel<DonateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

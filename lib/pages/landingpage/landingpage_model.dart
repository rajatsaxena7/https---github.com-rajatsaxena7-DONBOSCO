import '/flutter_flow/flutter_flow_util.dart';
import 'landingpage_widget.dart' show LandingpageWidget;
import 'package:flutter/material.dart';

class LandingpageModel extends FlutterFlowModel<LandingpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

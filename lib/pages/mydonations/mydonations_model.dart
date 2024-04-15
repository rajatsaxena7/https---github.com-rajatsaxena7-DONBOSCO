import '/flutter_flow/flutter_flow_util.dart';
import 'mydonations_widget.dart' show MydonationsWidget;
import 'package:flutter/material.dart';

class MydonationsModel extends FlutterFlowModel<MydonationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

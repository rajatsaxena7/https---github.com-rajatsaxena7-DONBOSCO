// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> payerID(String url) async {
  // Add your function code here!
  Uri uri = Uri.parse(url);

  // Extract query parameter 'paymentId'
  String? paymentId = uri.queryParameters['PayerID'];
  print(paymentId);

  // Return extracted PAYID
  return paymentId;
}

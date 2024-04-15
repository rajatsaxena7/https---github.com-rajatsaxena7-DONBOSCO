// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_inappwebview/flutter_inappwebview.dart' as web;

class Openwebview extends StatefulWidget {
  const Openwebview({
    super.key,
    this.width,
    this.height,
    required this.url,
    required this.authuser,
  });

  final double? width;
  final double? height;
  final String url;
  final DocumentReference authuser;

  @override
  State<Openwebview> createState() => _OpenwebviewState();
}

class _OpenwebviewState extends State<Openwebview> {
  late web.InAppWebViewController _webViewController;

  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: web.InAppWebView(
        initialUrlRequest: web.URLRequest(url: web.WebUri(widget.url)),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) {
          print('Current URL: $url');
          updateUserData(url.toString());
        },
        // You can also use onLoadStop for when the page finishes loading
      ),
    );
  }

  void updateUserData(String url) async {
    // Update the user document with the new URL
    try {
      await widget.authuser.update({'url': url});
      print('User data updated successfully with URL: $url');
    } catch (e) {
      print('Error updating user data: $e');
      // Handle error as needed
    }
  }
}

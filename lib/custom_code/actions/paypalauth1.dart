// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> paypalauth1() async {
  // Add your function code here!
  final String tokenUrl = 'https://api.paypal.com/v1/oauth2/token';

  // Replace 'YOUR_CLIENT_ID' and 'YOUR_CLIENT_SECRET' with your actual PayPal client ID and secret
  final String clientId =
      'AQJD6TVdSVhhSJ7tkrR4NcnVafwobW5cr5WidxdTE_g48Hvcc1Wo-zHbbiqgkUhRDdisJmacDLAxxN24';
  final String clientSecret =
      'EGkjPoFyluMGQ3lY9X5SnrdeTqApsZsOrJRoG1mGjMCsSb-2I102OJi5U6QKgGNfkBGmEe7Vkjh4iOzj';

  // Encode client credentials to base64
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret'));

  // Headers for the request
  Map<String, String> headers = {
    'Authorization': basicAuth,
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  // Body of the request
  Map<String, String> body = {'grant_type': 'client_credentials'};

  try {
    // Make POST request to obtain access token
    http.Response response =
        await http.post(Uri.parse(tokenUrl), headers: headers, body: body);

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the response body
      Map<String, dynamic> data = jsonDecode(response.body);

      // Return the access token
      return data['access_token'];
    } else {
      // If the request failed, throw an exception with the error message
      throw Exception('Failed to authenticate with PayPal API');
    }
  } catch (e) {
    // If an error occurred during the request, throw an exception with the error message
    throw Exception('Failed to authenticate with PayPal API: $e');
  }
}

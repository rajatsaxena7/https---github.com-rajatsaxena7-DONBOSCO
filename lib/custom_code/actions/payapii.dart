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

Future<dynamic> payapii(
  double amount,
  String authtoken,
) async {
  // Add your function code here!
  String domain = "https://api.paypal.com";

  try {
    final response = await http.post(
      Uri.parse('$domain/v1/payments/payment'),
      body: jsonEncode({
        "intent": "sale",
        "payer": {"payment_method": "paypal"},
        "transactions": [
          {
            "amount": {
              "total": amount,
              "currency": "USD",
              "details": {
                "subtotal": amount,
                "shipping": 0,
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": [
                {
                  "name": "Donation",
                  "quantity": 1,
                  "price": amount,
                  "currency": "USD"
                }
              ]
            }
          }
        ],
        "note_to_payer": "Contact us for any questions on your order.",
        "redirect_urls": {
          "return_url":
              "https://donbosco2000.flutterflow.app/donationcompleted",
          "cancel_url": "DONBOSCO.COM"
        }
      }),
      headers: {
        'Authorization': 'Bearer $authtoken',
        'Content-Type': 'application/json'
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 201) {
      if (body["links"] != null && body["links"].length > 0) {
        List links = body["links"];

        String executeUrl = "";
        String approvalUrl = "";
        final item = links.firstWhere((o) => o["rel"] == "approval_url",
            orElse: () => null);
        if (item != null) {
          approvalUrl = item["href"];
        }
        final item1 =
            links.firstWhere((o) => o["rel"] == "execute", orElse: () => null);
        if (item1 != null) {
          executeUrl = item1["href"];
        }
        return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
      }
      return {};
    } else {
      return body;
    }
  } catch (e) {
    rethrow;
  }
}

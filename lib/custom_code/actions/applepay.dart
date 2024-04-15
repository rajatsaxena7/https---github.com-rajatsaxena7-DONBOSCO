// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart'; // Import for PlatformException

import 'package:apple_pay_flutter/apple_pay_flutter.dart';

Future<void> applepay() async {
  // List of items with label & price
  List<PaymentItem> paymentItems = [
    PaymentItem(label: 'Label', amount: 1.00, shippingcharge: 2.00)
  ];

  try {
    // initiate payment
    var applePaymentData = await ApplePayFlutter.makePayment(
      countryCode: "US",
      currencyCode: "SAR",
      paymentNetworks: [
        PaymentNetwork.visa,
        PaymentNetwork.mastercard,
        PaymentNetwork.amex,
        PaymentNetwork.mada
      ],
      merchantIdentifier: "merchant.com.mycompany.donBosco",
      paymentItems: paymentItems,
      customerEmail: "demo.user@business.com",
      customerName: "Demo User",
      companyName: "Demo Company",
    );

    // This logs the Apple Pay response data
    print(applePaymentData.toString());
  } on PlatformException catch (e) {
    print('Failed payment: ${e.message}');
  }
}

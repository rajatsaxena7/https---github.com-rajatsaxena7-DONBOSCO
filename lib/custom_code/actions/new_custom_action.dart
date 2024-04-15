// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> newCustomAction(
  double donationamount,
  DocumentReference? documentReference,
  Future Function(CampaignsRecord donationupdated)? actions,
) async {
  // Add your function code here!
  try {
    // Specify the document location in your Firebase collection
    var documentReference = FirebaseFirestore.instance
        .collection('campaigns')
        .doc('documentReference');

    // Fetch the current total from the document
    var documentSnapshot = await documentReference.get();
    double currentTotal = documentSnapshot['totalDonations'] ??
        0.0; // Replace 'total' with your field name

    // Add the donation amount to the current total
    double newTotal = currentTotal + donationamount;

    // Update the document with the new total
    await documentReference.update({'totalDonations': newTotal});

    // Return the new total
    return newTotal;
  } catch (e) {
    // Handle any errors here
    print('Error updating totalDonations: $e');
    return -1; // or handle the error in a way that makes sense for your app
  }
}

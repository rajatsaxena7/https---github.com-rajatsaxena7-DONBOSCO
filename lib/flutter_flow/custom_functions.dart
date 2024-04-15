import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? newCustomFunction(
  double totalDonations,
  double maxValue,
) {
  if (maxValue == 0) {
    return 0.0;
  }

  // Calculate the fraction of the total donations relative to the maximum value
  double fraction = totalDonations / maxValue;

  // Ensure that the fraction is between 0.0 and 1.0
  fraction = fraction.clamp(0.0, 1.0);

  // Return the fraction value
  return fraction;
}

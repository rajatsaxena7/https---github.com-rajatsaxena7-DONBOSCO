import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/WhatsApp_Image_2023-11-11_at_16.45.48_37d5a1d5.jpg',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'loginpage': ParameterData.none(),
  'signuppage': ParameterData.none(),
  'landingpage': ParameterData.none(),
  'settings': ParameterData.none(),
  'donate': ParameterData.none(),
  'campaigndetails': (data) async => ParameterData(
        allParams: {
          'documentid': getParameter<DocumentReference>(data, 'documentid'),
        },
      ),
  'paymentpage': (data) async => ParameterData(
        allParams: {
          'paymentinfo': getParameter<DocumentReference>(data, 'paymentinfo'),
        },
      ),
  'myaccount': ParameterData.none(),
  'privacy_policy': ParameterData.none(),
  'raiseissue': ParameterData.none(),
  'mydonations': ParameterData.none(),
  'categories': (data) async => ParameterData(
        allParams: {
          'categoryname': getParameter<String>(data, 'categoryname'),
        },
      ),
  'phone_number_verify': ParameterData.none(),
  'phone': ParameterData.none(),
  'search': ParameterData.none(),
  'deleteaccount': ParameterData.none(),
  'onboarding': ParameterData.none(),
  'loginpageCopy': ParameterData.none(),
  'donationcompleted': (data) async => ParameterData(
        allParams: {
          'authtoken': getParameter<String>(data, 'authtoken'),
        },
      ),
  'formpage': ParameterData.none(),
  'paymentprocessingpage': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
          'campaignref': getParameter<DocumentReference>(data, 'campaignref'),
          'amount': getParameter<String>(data, 'amount'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

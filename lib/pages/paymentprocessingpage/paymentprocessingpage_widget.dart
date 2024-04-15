import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'paymentprocessingpage_model.dart';
export 'paymentprocessingpage_model.dart';

class PaymentprocessingpageWidget extends StatefulWidget {
  const PaymentprocessingpageWidget({
    super.key,
    required this.url,
    required this.campaignref,
    required this.amount,
  });

  final String? url;
  final DocumentReference? campaignref;
  final String? amount;

  @override
  State<PaymentprocessingpageWidget> createState() =>
      _PaymentprocessingpageWidgetState();
}

class _PaymentprocessingpageWidgetState
    extends State<PaymentprocessingpageWidget> {
  late PaymentprocessingpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentprocessingpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 30000),
        callback: (timer) async {
          _model.authtoken = await actions.paypalauth1();
          _model.payid = await actions.payid(
            valueOrDefault(currentUserDocument?.url, ''),
          );
          _model.payerid = await actions.payerID(
            valueOrDefault(currentUserDocument?.url, ''),
          );
          _model.apiResultcit = await PaymentapiCall.call(
            token: _model.authtoken,
            payid: _model.payid,
            payerId: _model.payerid,
          );
          if ((_model.apiResultcit?.succeeded ?? true)) {
            context.pushNamed('landingpage');

            _model.instantTimer?.cancel();

            await currentUserReference!.update(createUsersRecordData(
              url: '',
            ));

            await DonationsRecord.collection
                .doc()
                .set(createDonationsRecordData(
                  userId: currentUserReference,
                  campaignID: widget.campaignref,
                  amount: FFAppState().amounttobepaid,
                  donationDate: getCurrentTimestamp,
                ));

            await widget.campaignref!.update({
              ...mapToFirestore(
                {
                  'totalDonations':
                      FieldValue.increment(FFAppState().amounttobepaid),
                },
              ),
            });
            setState(() {
              FFAppState().amounttobepaid = 0.0;
            });
          }
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.Openwebview(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    url: widget.url!,
                    authuser: currentUserReference!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _amounttobepaid = prefs.getDouble('ff_amounttobepaid') ?? _amounttobepaid;
    });
    _safeInit(() {
      _anonymous = prefs.getBool('ff_anonymous') ?? _anonymous;
    });
    _safeInit(() {
      _login = prefs.getBool('ff_login') ?? _login;
    });
    _safeInit(() {
      _landingpagelink =
          prefs.getString('ff_landingpagelink') ?? _landingpagelink;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _amounttobepaid = 0.0;
  double get amounttobepaid => _amounttobepaid;
  set amounttobepaid(double value) {
    _amounttobepaid = value;
    prefs.setDouble('ff_amounttobepaid', value);
  }

  bool _anonymous = false;
  bool get anonymous => _anonymous;
  set anonymous(bool value) {
    _anonymous = value;
    prefs.setBool('ff_anonymous', value);
  }

  String _PHONECODE = '';
  String get PHONECODE => _PHONECODE;
  set PHONECODE(String value) {
    _PHONECODE = value;
  }

  bool _login = false;
  bool get login => _login;
  set login(bool value) {
    _login = value;
    prefs.setBool('ff_login', value);
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String value) {
    _phonenumber = value;
  }

  String _landingpagelink = '';
  String get landingpagelink => _landingpagelink;
  set landingpagelink(String value) {
    _landingpagelink = value;
    prefs.setString('ff_landingpagelink', value);
  }

  List<dynamic> _jsonurl = [];
  List<dynamic> get jsonurl => _jsonurl;
  set jsonurl(List<dynamic> value) {
    _jsonurl = value;
  }

  void addToJsonurl(dynamic value) {
    _jsonurl.add(value);
  }

  void removeFromJsonurl(dynamic value) {
    _jsonurl.remove(value);
  }

  void removeAtIndexFromJsonurl(int index) {
    _jsonurl.removeAt(index);
  }

  void updateJsonurlAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _jsonurl[index] = updateFn(_jsonurl[index]);
  }

  void insertAtIndexInJsonurl(int index, dynamic value) {
    _jsonurl.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

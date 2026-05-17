import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _printLocation = '';
  String get printLocation => _printLocation;
  set printLocation(String value) {
    _printLocation = value;
  }

  LocationStruct _curLocation = LocationStruct();
  LocationStruct get curLocation => _curLocation;
  set curLocation(LocationStruct value) {
    _curLocation = value;
  }

  void updateCurLocationStruct(Function(LocationStruct) updateFn) {
    updateFn(_curLocation);
  }
}

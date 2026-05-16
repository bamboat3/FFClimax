// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';
import '/custom_code/determinePosition.dart';

Future<String> getCurrentLocation() async {
  // Add your function code here!

  Position pos = await determinePosition();

  return '${pos.latitude}, ${pos.longitude}';
}

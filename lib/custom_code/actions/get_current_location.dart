// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:climax/custom_code/determinePosition.dart';
import 'package:geolocator/geolocator.dart';

Future<LocationStruct> getCurrentLocation() async {
  // Add your function code here!
  Position pos = await determinePosition();

  LocationStruct loc = LocationStruct(
    latitude: pos.latitude.toString(),
    longitude: pos.longitude.toString(),
  );
  return loc;
}

// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends BaseStruct {
  LocationStruct({
    String? longitude,
    String? latitude,
  })  : _longitude = longitude,
        _latitude = latitude;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        longitude: data['longitude'] as String?,
        latitude: data['latitude'] as String?,
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'longitude': _longitude,
        'latitude': _latitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationStruct &&
        longitude == other.longitude &&
        latitude == other.latitude;
  }

  @override
  int get hashCode => const ListEquality().hash([longitude, latitude]);
}

LocationStruct createLocationStruct({
  String? longitude,
  String? latitude,
}) =>
    LocationStruct(
      longitude: longitude,
      latitude: latitude,
    );

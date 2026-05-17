import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loading_screen_widget.dart' show LoadingScreenWidget;
import 'package:flutter/material.dart';

class LoadingScreenModel extends FlutterFlowModel<LoadingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCurrentLocation] action in Button widget.
  LocationStruct? outputLoc;
  // Stores action output result for [Backend Call - API (weather)] action in Button widget.
  ApiCallResponse? apiResultmv2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

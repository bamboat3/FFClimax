import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'city_screen_widget.dart' show CityScreenWidget;
import 'package:flutter/material.dart';

class CityScreenModel extends FlutterFlowModel<CityScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (cityname)] action in Text widget.
  ApiCallResponse? apiResultebi;
  // Stores action output result for [Backend Call - API (weather)] action in Text widget.
  ApiCallResponse? outputWeatherCity;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

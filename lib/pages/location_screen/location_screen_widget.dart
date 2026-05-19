import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'location_screen_model.dart';
export 'location_screen_model.dart';

class LocationScreenWidget extends StatefulWidget {
  const LocationScreenWidget({
    super.key,
    required this.curLoction,
  });

  final dynamic curLoction;

  static String routeName = 'locationScreen';
  static String routePath = '/locationScreen';

  @override
  State<LocationScreenWidget> createState() => _LocationScreenWidgetState();
}

class _LocationScreenWidgetState extends State<LocationScreenWidget> {
  late LocationScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/location_background.jpg',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.near_me,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 50.0,
                        ),
                        Icon(
                          Icons.location_city,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: getJsonField(
                                  widget.curLoction,
                                  r'''$.main.temp''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Spartan MB',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: FFAppConstants.kTempTextStyle
                                          .toDouble(),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              TextSpan(
                                text: '°',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Spartan MB',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize:
                                      FFAppConstants.kTempTextStyle.toDouble(),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Text(
                          functions.getWeatherIcon(getJsonField(
                            widget.curLoction,
                            r'''$.weather[0].id''',
                          )),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Spartan MB',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: FFAppConstants.kConditionTextStyle
                                        .toDouble(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      functions.getMessage(getJsonField(
                        widget.curLoction,
                        r'''$.main.temp''',
                      )),
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Spartan MB',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize:
                                FFAppConstants.kMessageTextStyle.toDouble(),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

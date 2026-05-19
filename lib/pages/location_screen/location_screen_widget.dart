import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().temp = functions.convertDoubleToInt(getJsonField(
        widget.curLoction,
        r'''$.main.temp''',
      ));
      FFAppState().condition = functions.getWeatherIcon(getJsonField(
        widget.curLoction,
        r'''$.weather[0].id''',
      ));
      FFAppState().message =
          functions.getMessage(functions.convertDoubleToInt(getJsonField(
        widget.curLoction,
        r'''$.main.temp''',
      )));
      safeSetState(() {});
    });
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.outputLoc2 =
                                await actions.getCurrentLocation();
                            _model.apiResultmv22 = await WeatherCall.call(
                              plat: _model.outputLoc2?.latitude,
                              plon: _model.outputLoc2?.longitude,
                              papikey: FFAppConstants.kAPIKey,
                            );

                            if ((_model.apiResultmv22?.succeeded ?? true)) {
                              FFAppState().temp =
                                  functions.convertDoubleToInt(getJsonField(
                                (_model.apiResultmv22?.jsonBody ?? ''),
                                r'''$.main.temp''',
                              ));
                              FFAppState().condition =
                                  functions.getWeatherIcon(getJsonField(
                                (_model.apiResultmv22?.jsonBody ?? ''),
                                r'''$.weather[0].id''',
                              ));
                              FFAppState().message = functions.getMessage(
                                  functions.convertDoubleToInt(getJsonField(
                                (_model.apiResultmv22?.jsonBody ?? ''),
                                r'''$.main.temp''',
                              )));
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    (_model.apiResultmv22?.exceptionMessage ??
                                        ''),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.near_me,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 50.0,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              CityScreenWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 600),
                                ),
                              },
                            );
                          },
                          child: Icon(
                            Icons.location_city,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFAppState().temp.toString(),
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
                                    fontSize: FFAppConstants.kTempTextStyle
                                        .toDouble(),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Text(
                            FFAppState().condition,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        FFAppState().message,
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Spartan MB',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize:
                                  FFAppConstants.kMessageTextStyle.toDouble(),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
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

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'balance_card_model.dart';
export 'balance_card_model.dart';

class BalanceCardWidget extends StatefulWidget {
  const BalanceCardWidget({super.key});

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  late BalanceCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BalanceCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // loadSales
      setState(() {
        _model.filledSales = functions
            .fillProductInSale(
                FFAppState().sales.toList(), FFAppState().products.toList())
            .toList()
            .cast<SaleStruct>();
      });
      // calculateProfitAndCosts
      setState(() {
        _model.totalProfit =
            functions.calculateTotalProfit(_model.filledSales.toList());
        _model.totalCosts = functions.calculateTotalSalesCost(functions
            .calculateProductSales(_model.filledSales.toList(),
                FFAppState().products.toList(), false)
            .toList());
      });
      setState(() {
        _model.cashFlow = _model.totalProfit - _model.totalCosts;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            color: Color(0x520E151B),
            offset: Offset(0.0, 1.0),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Visibility(
        visible: (FFAppState().sales.isNotEmpty) == false,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Text(
                  'Cash flow',
                  style: FlutterFlowTheme.of(context).headlineLarge,
                ),
              ),
              Text(
                formatNumber(
                  _model.cashFlow,
                  formatType: FormatType.decimal,
                  decimalType: DecimalType.commaDecimal,
                  currency: '\$',
                ),
                textAlign: TextAlign.end,
                style: FlutterFlowTheme.of(context).displayLarge,
              ),
              Divider(
                height: 2.0,
                thickness: 1.0,
                color: Color(0xFFE5E7EB),
              ),
              Text(
                'Profit',
                style: FlutterFlowTheme.of(context).labelMedium,
              ),
              RichText(
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: formatNumber(
                        _model.totalProfit,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.commaDecimal,
                        currency: '\$',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    TextSpan(
                      text: ' / ',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    TextSpan(
                      text: FFAppState().sales.isNotEmpty
                          ? formatNumber(
                              _model.totalProfit / _model.cashFlow,
                              formatType: FormatType.percent,
                            )
                          : '-',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    )
                  ],
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF15161E),
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: LinearPercentIndicator(
                  percent: _model.totalProfit / _model.cashFlow,
                  lineHeight: 12.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).alternate,
                  backgroundColor: Color(0x400D5155),
                  barRadius: Radius.circular(16.0),
                  padding: EdgeInsets.zero,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Tap to see more',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

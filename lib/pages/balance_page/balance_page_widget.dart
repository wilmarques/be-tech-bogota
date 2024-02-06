import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'balance_page_model.dart';

export 'balance_page_model.dart';

class BalancePageWidget extends StatefulWidget {
  const BalancePageWidget({super.key});

  @override
  State<BalancePageWidget> createState() => _BalancePageWidgetState();
}

class _BalancePageWidgetState extends State<BalancePageWidget> {
  late BalancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BalancePageModel());

    // On page load action.
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
            .calculateProductSales(FFAppState().sales.toList(),
                FFAppState().products.toList(), false)
            .toList());
      });
      // calculateCashFlow
      setState(() {
        _model.cashFlow = _model.totalProfit - _model.totalCosts;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Balance',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Santander Headline',
                    color: Colors.white,
                    fontSize: 22.0,
                    useGoogleFonts: false,
                  ),
            ),
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 10.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('AddSalePage');
              },
            ),
          ],
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Builder(builder: (context) {
            return FFAppState().sales.isNotEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 12.0, 0.0),
                        child: Text(
                          'Cash flow',
                          style: FlutterFlowTheme.of(context).headlineLarge,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          const Divider(
                            height: 2.0,
                            thickness: 1.0,
                            color: Color(0xFFE5E7EB),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Profit',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: formatNumber(
                                                _model.totalProfit,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.commaDecimal,
                                                currency: '\$',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                            ),
                                            TextSpan(
                                              text: ' / ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            TextSpan(
                                              text: formatNumber(
                                                (_model.totalProfit /
                                                        _model.cashFlow)
                                                    .clamp(0.0, 1.0),
                                                formatType: FormatType.percent,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: const Color(0xFF15161E),
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: (_model.totalProfit /
                                                  _model.cashFlow)
                                              .clamp(0.0, 1.0),
                                          lineHeight: 12.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          backgroundColor:
                                              const Color(0x400D5155),
                                          barRadius:
                                              const Radius.circular(16.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 4.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Costs',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: formatNumber(
                                                _model.totalCosts,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.commaDecimal,
                                                currency: '\$',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                            ),
                                            TextSpan(
                                              text: ' / ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            TextSpan(
                                              text: formatNumber(
                                                (_model.totalProfit /
                                                        _model.cashFlow)
                                                    .clamp(0.0, 1.0),
                                                formatType: FormatType.percent,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: const Color(0xFF15161E),
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: (_model.totalProfit /
                                                  _model.cashFlow)
                                              .clamp(0.0, 1.0),
                                          lineHeight: 12.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          backgroundColor:
                                              const Color(0x41990000),
                                          barRadius:
                                              const Radius.circular(16.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 4.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 2.0,
                            thickness: 1.0,
                            color: Color(0xFFE5E7EB),
                          ),
                        ],
                      ),
                      Text(
                        'Past sales',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final salesDataTable = _model.filledSales.toList();
                            return FlutterFlowDataTable<SaleStruct>(
                              controller: _model.paginatedDataTableController,
                              data: salesDataTable,
                              columnsBuilder: (onSortChanged) => [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Product',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Profit',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Costs',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                              ],
                              dataRowBuilder: (salesDataTableItem,
                                      salesDataTableIndex,
                                      selected,
                                      onSelectChanged) =>
                                  DataRow(
                                color: MaterialStateProperty.all(
                                  salesDataTableIndex % 2 == 0
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                ),
                                cells: [
                                  Text(
                                    salesDataTableItem.product.name,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    formatNumber(
                                      salesDataTableItem.total,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                      currency: '\$',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    formatNumber(
                                      functions.calculateSaleCost(
                                          salesDataTableItem),
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                      currency: '\$',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ].map((c) => DataCell(c)).toList(),
                              ),
                              paginated: false,
                              selectable: false,
                              headingRowHeight: 56.0,
                              dataRowHeight: 48.0,
                              columnSpacing: 20.0,
                              headingRowColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              addHorizontalDivider: true,
                              horizontalDividerColor:
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              horizontalDividerThickness: 1.0,
                              addVerticalDivider: false,
                            );
                          },
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  )
                : const Center(child: Text('Add sales to see them here'));
          }),
        ),
      ),
    );
  }
}

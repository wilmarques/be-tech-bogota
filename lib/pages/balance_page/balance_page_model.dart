import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'balance_page_widget.dart' show BalancePageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class BalancePageModel extends FlutterFlowModel<BalancePageWidget> {
  ///  Local state fields for this page.

  double cashFlow = 0.0;

  double totalProfit = 0.0;

  double totalCosts = 0.0;

  List<SaleStruct> filledSales = [];
  void addToFilledSales(SaleStruct item) => filledSales.add(item);
  void removeFromFilledSales(SaleStruct item) => filledSales.remove(item);
  void removeAtIndexFromFilledSales(int index) => filledSales.removeAt(index);
  void insertAtIndexInFilledSales(int index, SaleStruct item) =>
      filledSales.insert(index, item);
  void updateFilledSalesAtIndex(int index, Function(SaleStruct) updateFn) =>
      filledSales[index] = updateFn(filledSales[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<SaleStruct>();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

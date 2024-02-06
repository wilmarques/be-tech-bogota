import 'package:flutter/material.dart';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'balance_page_widget.dart' show BalancePageWidget;

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

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<SaleStruct>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

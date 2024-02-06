import '/backend/schema/structs/index.dart';
import '/components/product_sales/product_sales_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_sales_list_widget.dart' show ProductSalesListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductSalesListModel extends FlutterFlowModel<ProductSalesListWidget> {
  ///  Local state fields for this component.

  List<ProductSalesStruct> productSales = [];
  void addToProductSales(ProductSalesStruct item) => productSales.add(item);
  void removeFromProductSales(ProductSalesStruct item) =>
      productSales.remove(item);
  void removeAtIndexFromProductSales(int index) => productSales.removeAt(index);
  void insertAtIndexInProductSales(int index, ProductSalesStruct item) =>
      productSales.insert(index, item);
  void updateProductSalesAtIndex(
          int index, Function(ProductSalesStruct) updateFn) =>
      productSales[index] = updateFn(productSales[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

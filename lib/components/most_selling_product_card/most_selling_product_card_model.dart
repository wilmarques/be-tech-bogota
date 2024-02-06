import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'most_selling_product_card_widget.dart'
    show MostSellingProductCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MostSellingProductCardModel
    extends FlutterFlowModel<MostSellingProductCardWidget> {
  ///  Local state fields for this component.

  ProductSalesStruct? productSales;
  void updateProductSalesStruct(Function(ProductSalesStruct) updateFn) =>
      updateFn(productSales ??= ProductSalesStruct());

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

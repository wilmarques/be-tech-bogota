import '/components/product_sales_list/product_sales_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'insights_page_widget.dart' show InsightsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InsightsPageModel extends FlutterFlowModel<InsightsPageWidget> {
  ///  Local state fields for this page.

  bool orderByLeastSelling = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ProductSalesList component.
  late ProductSalesListModel productSalesListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    productSalesListModel = createModel(context, () => ProductSalesListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    productSalesListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

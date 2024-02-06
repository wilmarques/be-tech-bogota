import 'package:flutter/material.dart';

import '/components/product_sales_list/product_sales_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'insights_page_widget.dart' show InsightsPageWidget;

class InsightsPageModel extends FlutterFlowModel<InsightsPageWidget> {
  ///  Local state fields for this page.

  bool orderByLeastSelling = false;

  ///  State fields for stateful widgets in this page.

  // Model for ProductSalesList component.
  late ProductSalesListModel productSalesListModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    productSalesListModel = createModel(context, () => ProductSalesListModel());
  }

  @override
  void dispose() {
    productSalesListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

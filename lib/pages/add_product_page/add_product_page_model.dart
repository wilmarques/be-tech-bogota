import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'add_product_page_widget.dart' show AddProductPageWidget;

class AddProductPageModel extends FlutterFlowModel<AddProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NameTextField widget.
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  // State field(s) for ProductionCostTextField widget.
  TextEditingController? productionCostTextFieldController;
  String? Function(BuildContext, String?)?
      productionCostTextFieldControllerValidator;
  // State field(s) for PriceTextField widget.
  TextEditingController? priceTextFieldController;
  String? Function(BuildContext, String?)? priceTextFieldControllerValidator;
  // State field(s) for ImageTextField widget.
  TextEditingController? imageTextFieldController;
  String? Function(BuildContext, String?)? imageTextFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameTextFieldController?.dispose();

    productionCostTextFieldController?.dispose();

    priceTextFieldController?.dispose();

    imageTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

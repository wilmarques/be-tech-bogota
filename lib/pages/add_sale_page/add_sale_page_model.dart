import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_sale_page_widget.dart' show AddSalePageWidget;

class AddSalePageModel extends FlutterFlowModel<AddSalePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ProductDropDown widget.
  int? productDropDownValue;
  FormFieldController<int>? productDropDownValueController;
  // State field(s) for QuantityTextField widget.
  TextEditingController? quantityTextFieldController;
  String? Function(BuildContext, String?)? quantityTextFieldControllerValidator;
  // State field(s) for TotalTextField widget.
  TextEditingController? totalTextFieldController;
  String? Function(BuildContext, String?)? totalTextFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quantityTextFieldController?.dispose();
    totalTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

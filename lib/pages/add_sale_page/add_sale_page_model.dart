import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_sale_page_widget.dart' show AddSalePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSalePageModel extends FlutterFlowModel<AddSalePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ProductDropDown widget.
  int? productDropDownValue;
  FormFieldController<int>? productDropDownValueController;
  // State field(s) for QuantityTextField widget.
  FocusNode? quantityTextFieldFocusNode;
  TextEditingController? quantityTextFieldController;
  String? Function(BuildContext, String?)? quantityTextFieldControllerValidator;
  // State field(s) for TotalTextField widget.
  FocusNode? totalTextFieldFocusNode;
  TextEditingController? totalTextFieldController;
  String? Function(BuildContext, String?)? totalTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    quantityTextFieldFocusNode?.dispose();
    quantityTextFieldController?.dispose();

    totalTextFieldFocusNode?.dispose();
    totalTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

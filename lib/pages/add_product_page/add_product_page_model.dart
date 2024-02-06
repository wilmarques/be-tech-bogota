import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_product_page_widget.dart' show AddProductPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductPageModel extends FlutterFlowModel<AddProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  // State field(s) for ProductionCostTextField widget.
  FocusNode? productionCostTextFieldFocusNode;
  TextEditingController? productionCostTextFieldController;
  String? Function(BuildContext, String?)?
      productionCostTextFieldControllerValidator;
  // State field(s) for PriceTextField widget.
  FocusNode? priceTextFieldFocusNode;
  TextEditingController? priceTextFieldController;
  String? Function(BuildContext, String?)? priceTextFieldControllerValidator;
  // State field(s) for ImageTextField widget.
  FocusNode? imageTextFieldFocusNode;
  TextEditingController? imageTextFieldController;
  String? Function(BuildContext, String?)? imageTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameTextFieldFocusNode?.dispose();
    nameTextFieldController?.dispose();

    productionCostTextFieldFocusNode?.dispose();
    productionCostTextFieldController?.dispose();

    priceTextFieldFocusNode?.dispose();
    priceTextFieldController?.dispose();

    imageTextFieldFocusNode?.dispose();
    imageTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

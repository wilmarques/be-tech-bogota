import '/components/balance_card/balance_card_widget.dart';
import '/components/most_selling_product_card/most_selling_product_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BalanceCard component.
  late BalanceCardModel balanceCardModel;
  // Model for MostSellingProductCard component.
  late MostSellingProductCardModel mostSellingProductCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    balanceCardModel = createModel(context, () => BalanceCardModel());
    mostSellingProductCardModel =
        createModel(context, () => MostSellingProductCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    balanceCardModel.dispose();
    mostSellingProductCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

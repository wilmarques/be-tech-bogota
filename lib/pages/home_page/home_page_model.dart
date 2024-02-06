import 'package:flutter/material.dart';

import '/components/balance_card/balance_card_widget.dart';
import '/components/most_selling_product_card/most_selling_product_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BalanceCard component.
  late BalanceCardModel balanceCardModel;
  // Model for MostSellingProductCard component.
  late MostSellingProductCardModel mostSellingProductCardModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    balanceCardModel = createModel(context, () => BalanceCardModel());
    mostSellingProductCardModel =
        createModel(context, () => MostSellingProductCardModel());
  }

  @override
  void dispose() {
    balanceCardModel.dispose();
    mostSellingProductCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

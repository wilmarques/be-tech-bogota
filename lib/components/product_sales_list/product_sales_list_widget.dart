import '/backend/schema/structs/index.dart';
import '/components/product_sales/product_sales_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_sales_list_model.dart';
export 'product_sales_list_model.dart';

class ProductSalesListWidget extends StatefulWidget {
  const ProductSalesListWidget({
    super.key,
    bool? orderByLeastSelling,
  }) : this.orderByLeastSelling = orderByLeastSelling ?? true;

  final bool orderByLeastSelling;

  @override
  State<ProductSalesListWidget> createState() => _ProductSalesListWidgetState();
}

class _ProductSalesListWidgetState extends State<ProductSalesListWidget> {
  late ProductSalesListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductSalesListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // parseProductSales
      setState(() {
        _model.productSales = functions
            .calculateProductSales(FFAppState().sales.toList(),
                FFAppState().products.toList(), false)
            .toList()
            .cast<ProductSalesStruct>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final productSalesListView = _model.productSales.toList();
        return ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: productSalesListView.length,
          separatorBuilder: (_, __) => SizedBox(height: 10.0),
          itemBuilder: (context, productSalesListViewIndex) {
            final productSalesListViewItem =
                productSalesListView[productSalesListViewIndex];
            return ProductSalesWidget(
              key: Key(
                  'Keyqis_${productSalesListViewIndex}_of_${productSalesListView.length}'),
              name: productSalesListViewItem.product.name,
              imageSrc: productSalesListViewItem.product.imageSrc,
              price: productSalesListViewItem.product.price,
              soldTimes: productSalesListViewItem.sales.length,
            );
          },
        );
      },
    );
  }
}

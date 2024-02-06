// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductSalesStruct extends BaseStruct {
  ProductSalesStruct({
    ProductStruct? product,
    List<SaleStruct>? sales,
  })  : _product = product,
        _sales = sales;

  // "Product" field.
  ProductStruct? _product;
  ProductStruct get product => _product ?? ProductStruct();
  set product(ProductStruct? val) => _product = val;
  void updateProduct(Function(ProductStruct) updateFn) =>
      updateFn(_product ??= ProductStruct());
  bool hasProduct() => _product != null;

  // "Sales" field.
  List<SaleStruct>? _sales;
  List<SaleStruct> get sales => _sales ?? const [];
  set sales(List<SaleStruct>? val) => _sales = val;
  void updateSales(Function(List<SaleStruct>) updateFn) =>
      updateFn(_sales ??= []);
  bool hasSales() => _sales != null;

  static ProductSalesStruct fromMap(Map<String, dynamic> data) =>
      ProductSalesStruct(
        product: ProductStruct.maybeFromMap(data['Product']),
        sales: getStructList(
          data['Sales'],
          SaleStruct.fromMap,
        ),
      );

  static ProductSalesStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductSalesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Product': _product?.toMap(),
        'Sales': _sales?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Product': serializeParam(
          _product,
          ParamType.DataStruct,
        ),
        'Sales': serializeParam(
          _sales,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ProductSalesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductSalesStruct(
        product: deserializeStructParam(
          data['Product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStruct.fromSerializableMap,
        ),
        sales: deserializeStructParam<SaleStruct>(
          data['Sales'],
          ParamType.DataStruct,
          true,
          structBuilder: SaleStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProductSalesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductSalesStruct &&
        product == other.product &&
        listEquality.equals(sales, other.sales);
  }

  @override
  int get hashCode => const ListEquality().hash([product, sales]);
}

ProductSalesStruct createProductSalesStruct({
  ProductStruct? product,
}) =>
    ProductSalesStruct(
      product: product ?? ProductStruct(),
    );

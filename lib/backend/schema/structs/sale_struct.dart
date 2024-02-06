// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SaleStruct extends BaseStruct {
  SaleStruct({
    int? id,
    int? productId,
    int? quantity,
    double? total,
    ProductStruct? product,
  })  : _id = id,
        _productId = productId,
        _quantity = quantity,
        _total = total,
        _product = product;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "ProductId" field.
  int? _productId;
  int get productId => _productId ?? 0;
  set productId(int? val) => _productId = val;
  void incrementProductId(int amount) => _productId = productId + amount;
  bool hasProductId() => _productId != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "Total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;
  void incrementTotal(double amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "Product" field.
  ProductStruct? _product;
  ProductStruct get product => _product ?? ProductStruct();
  set product(ProductStruct? val) => _product = val;
  void updateProduct(Function(ProductStruct) updateFn) =>
      updateFn(_product ??= ProductStruct());
  bool hasProduct() => _product != null;

  static SaleStruct fromMap(Map<String, dynamic> data) => SaleStruct(
        id: castToType<int>(data['Id']),
        productId: castToType<int>(data['ProductId']),
        quantity: castToType<int>(data['Quantity']),
        total: castToType<double>(data['Total']),
        product: ProductStruct.maybeFromMap(data['Product']),
      );

  static SaleStruct? maybeFromMap(dynamic data) =>
      data is Map ? SaleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'ProductId': _productId,
        'Quantity': _quantity,
        'Total': _total,
        'Product': _product?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'ProductId': serializeParam(
          _productId,
          ParamType.int,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'Total': serializeParam(
          _total,
          ParamType.double,
        ),
        'Product': serializeParam(
          _product,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SaleStruct fromSerializableMap(Map<String, dynamic> data) =>
      SaleStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        productId: deserializeParam(
          data['ProductId'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['Total'],
          ParamType.double,
          false,
        ),
        product: deserializeStructParam(
          data['Product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SaleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaleStruct &&
        id == other.id &&
        productId == other.productId &&
        quantity == other.quantity &&
        total == other.total &&
        product == other.product;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, productId, quantity, total, product]);
}

SaleStruct createSaleStruct({
  int? id,
  int? productId,
  int? quantity,
  double? total,
  ProductStruct? product,
}) =>
    SaleStruct(
      id: id,
      productId: productId,
      quantity: quantity,
      total: total,
      product: product ?? ProductStruct(),
    );

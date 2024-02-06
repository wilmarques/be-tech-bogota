// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends BaseStruct {
  ProductStruct({
    int? id,
    String? name,
    double? price,
    int? categoryId,
    double? productionCost,
    String? imageSrc,
  })  : _id = id,
        _name = name,
        _price = price,
        _categoryId = categoryId,
        _productionCost = productionCost,
        _imageSrc = imageSrc;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "CategoryId" field.
  int? _categoryId;
  int get categoryId => _categoryId ?? 1;
  set categoryId(int? val) => _categoryId = val;
  void incrementCategoryId(int amount) => _categoryId = categoryId + amount;
  bool hasCategoryId() => _categoryId != null;

  // "ProductionCost" field.
  double? _productionCost;
  double get productionCost => _productionCost ?? 0.0;
  set productionCost(double? val) => _productionCost = val;
  void incrementProductionCost(double amount) =>
      _productionCost = productionCost + amount;
  bool hasProductionCost() => _productionCost != null;

  // "ImageSrc" field.
  String? _imageSrc;
  String get imageSrc => _imageSrc ?? '';
  set imageSrc(String? val) => _imageSrc = val;
  bool hasImageSrc() => _imageSrc != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        id: castToType<int>(data['Id']),
        name: data['Name'] as String?,
        price: castToType<double>(data['Price']),
        categoryId: castToType<int>(data['CategoryId']),
        productionCost: castToType<double>(data['ProductionCost']),
        imageSrc: data['ImageSrc'] as String?,
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Id': _id,
        'Name': _name,
        'Price': _price,
        'CategoryId': _categoryId,
        'ProductionCost': _productionCost,
        'ImageSrc': _imageSrc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Id': serializeParam(
          _id,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Price': serializeParam(
          _price,
          ParamType.double,
        ),
        'CategoryId': serializeParam(
          _categoryId,
          ParamType.int,
        ),
        'ProductionCost': serializeParam(
          _productionCost,
          ParamType.double,
        ),
        'ImageSrc': serializeParam(
          _imageSrc,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        id: deserializeParam(
          data['Id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['Price'],
          ParamType.double,
          false,
        ),
        categoryId: deserializeParam(
          data['CategoryId'],
          ParamType.int,
          false,
        ),
        productionCost: deserializeParam(
          data['ProductionCost'],
          ParamType.double,
          false,
        ),
        imageSrc: deserializeParam(
          data['ImageSrc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductStruct &&
        id == other.id &&
        name == other.name &&
        price == other.price &&
        categoryId == other.categoryId &&
        productionCost == other.productionCost &&
        imageSrc == other.imageSrc;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, price, categoryId, productionCost, imageSrc]);
}

ProductStruct createProductStruct({
  int? id,
  String? name,
  double? price,
  int? categoryId,
  double? productionCost,
  String? imageSrc,
}) =>
    ProductStruct(
      id: id,
      name: name,
      price: price,
      categoryId: categoryId,
      productionCost: productionCost,
      imageSrc: imageSrc,
    );

import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _products = prefs
              .getStringList('ff_products')
              ?.map((x) {
                try {
                  return ProductStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _products;
    });
    _safeInit(() {
      _sales = prefs
              .getStringList('ff_sales')
              ?.map((x) {
                try {
                  return SaleStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _sales;
    });
    _safeInit(() {
      _categories = prefs
              .getStringList('ff_categories')
              ?.map((x) {
                try {
                  return CategoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _categories;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ProductStruct> _products = [];
  List<ProductStruct> get products => _products;
  set products(List<ProductStruct> value) {
    _products = value;
    prefs.setStringList(
        'ff_products', value.map((x) => x.serialize()).toList());
  }

  void addToProducts(ProductStruct value) {
    _products.add(value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeFromProducts(ProductStruct value) {
    _products.remove(value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProducts(int index) {
    _products.removeAt(index);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void updateProductsAtIndex(
    int index,
    ProductStruct Function(ProductStruct) updateFn,
  ) {
    _products[index] = updateFn(_products[index]);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProducts(int index, ProductStruct value) {
    _products.insert(index, value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  List<SaleStruct> _sales = [];
  List<SaleStruct> get sales => _sales;
  set sales(List<SaleStruct> value) {
    _sales = value;
    prefs.setStringList('ff_sales', value.map((x) => x.serialize()).toList());
  }

  void addToSales(SaleStruct value) {
    _sales.add(value);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void removeFromSales(SaleStruct value) {
    _sales.remove(value);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSales(int index) {
    _sales.removeAt(index);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void updateSalesAtIndex(
    int index,
    SaleStruct Function(SaleStruct) updateFn,
  ) {
    _sales[index] = updateFn(_sales[index]);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSales(int index, SaleStruct value) {
    _sales.insert(index, value);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  List<CategoryStruct> _categories = [];
  List<CategoryStruct> get categories => _categories;
  set categories(List<CategoryStruct> value) {
    _categories = value;
    prefs.setStringList(
        'ff_categories', value.map((x) => x.serialize()).toList());
  }

  void addToCategories(CategoryStruct value) {
    _categories.add(value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeFromCategories(CategoryStruct value) {
    _categories.remove(value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategories(int index) {
    _categories.removeAt(index);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void updateCategoriesAtIndex(
    int index,
    CategoryStruct Function(CategoryStruct) updateFn,
  ) {
    _categories[index] = updateFn(_categories[index]);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategories(int index, CategoryStruct value) {
    _categories.insert(index, value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

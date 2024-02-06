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
  set products(List<ProductStruct> _value) {
    _products = _value;
    prefs.setStringList(
        'ff_products', _value.map((x) => x.serialize()).toList());
  }

  void addToProducts(ProductStruct _value) {
    _products.add(_value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeFromProducts(ProductStruct _value) {
    _products.remove(_value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProducts(int _index) {
    _products.removeAt(_index);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void updateProductsAtIndex(
    int _index,
    ProductStruct Function(ProductStruct) updateFn,
  ) {
    _products[_index] = updateFn(_products[_index]);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProducts(int _index, ProductStruct _value) {
    _products.insert(_index, _value);
    prefs.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  List<SaleStruct> _sales = [];
  List<SaleStruct> get sales => _sales;
  set sales(List<SaleStruct> _value) {
    _sales = _value;
    prefs.setStringList('ff_sales', _value.map((x) => x.serialize()).toList());
  }

  void addToSales(SaleStruct _value) {
    _sales.add(_value);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void removeFromSales(SaleStruct _value) {
    _sales.remove(_value);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSales(int _index) {
    _sales.removeAt(_index);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void updateSalesAtIndex(
    int _index,
    SaleStruct Function(SaleStruct) updateFn,
  ) {
    _sales[_index] = updateFn(_sales[_index]);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSales(int _index, SaleStruct _value) {
    _sales.insert(_index, _value);
    prefs.setStringList('ff_sales', _sales.map((x) => x.serialize()).toList());
  }

  List<CategoryStruct> _categories = [];
  List<CategoryStruct> get categories => _categories;
  set categories(List<CategoryStruct> _value) {
    _categories = _value;
    prefs.setStringList(
        'ff_categories', _value.map((x) => x.serialize()).toList());
  }

  void addToCategories(CategoryStruct _value) {
    _categories.add(_value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeFromCategories(CategoryStruct _value) {
    _categories.remove(_value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategories(int _index) {
    _categories.removeAt(_index);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void updateCategoriesAtIndex(
    int _index,
    CategoryStruct Function(CategoryStruct) updateFn,
  ) {
    _categories[_index] = updateFn(_categories[_index]);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategories(int _index, CategoryStruct _value) {
    _categories.insert(_index, _value);
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

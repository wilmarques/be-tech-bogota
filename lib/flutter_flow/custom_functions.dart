import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<ProductSalesStruct> calculateProductSales(
  List<SaleStruct> sales,
  List<ProductStruct> products,
  bool orderByLeastSold,
) {
  final productSales = <ProductSalesStruct>[];

  for (final sale in sales) {
    final product = products.firstWhere((p) => p.id == sale.productId);
    final ProductSalesStruct? existingProductSales =
        productSales.firstWhere((ps) => ps.product.id == product.id);

    if (existingProductSales != null) {
      existingProductSales.sales.add(sale);
    } else {
      productSales.add(ProductSalesStruct(product: product, sales: [sale]));
    }
  }

  if (orderByLeastSold) {
    productSales.sort((a, b) => a.sales.length.compareTo(b.sales.length));
  } else {
    productSales.sort((a, b) => b.sales.length.compareTo(a.sales.length));
  }

  return productSales;
}

double calculateTotalSalesCost(List<ProductSalesStruct> productSales) {
  double totalCost = productSales.fold(
      0.0,
      (previousValue, productSale) =>
          previousValue +
          (productSale.product.productionCost * productSale.sales.length));
  return totalCost;
}

List<SaleStruct> fillProductInSale(
  List<SaleStruct> sales,
  List<ProductStruct> products,
) {
  // fill the sale.product property find the object in the products list
  for (var sale in sales) {
    sale.product =
        products.firstWhere((product) => product.id == sale.productId);
  }
  return sales;
}

double calculateTotalProfit(List<SaleStruct> sales) {
  return sales.fold(0.0, (previousValue, sale) => previousValue + sale.total);
}

double calculateSaleCost(SaleStruct sale) {
  return sale.quantity * sale.product.productionCost;
}

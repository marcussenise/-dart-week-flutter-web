// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import '../../models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amount;
  final double totalPrice;
  
  OrderProductDto({
    required this.product,
    required this.amount,
    required this.totalPrice,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'amount': amount,
      'total_price': totalPrice,
    };
  }

  factory OrderProductDto.fromMap(Map<String, dynamic> map) {
    return OrderProductDto(
      product: ProductModel.fromMap(map['product'] as Map<String,dynamic>),
      amount: map['amount'] as int,
      totalPrice: map['total_price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderProductDto.fromJson(String source) => OrderProductDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

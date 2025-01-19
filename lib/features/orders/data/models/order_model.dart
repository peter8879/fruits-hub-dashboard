
import 'package:fruit_hub_dashboard/features/orders/data/models/shiping_address_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/order_product__entity.dart';

import 'order_product__model.dart';

class OrderModel
{
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> products;
  final String paymentMethod;

  OrderModel({required this.totalPrice, required this.uID, required this.shippingAddress, required this.products, required this.paymentMethod});
  Map<String,dynamic>toJson(){
    return {
      'totalPrice': totalPrice,
      'uID': uID,
      'shippingAddress': shippingAddress.toJson(),
      'products': products.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
      'status': 'pending',
      'date': DateTime.now().toString(),
    };
  }
  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
      products: (json['products'] as List).map((e) => OrderProductModel.fromJson(e)).toList(),
      paymentMethod: json['paymentMethod'],
    );
  }
  OrderEntity toEntity(){
    return OrderEntity(
      totalPrice: totalPrice,
      uID: uID,
      shippingAddress: shippingAddress.toEntity(),
      products: products.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }


}
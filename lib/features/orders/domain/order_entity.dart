
import 'package:fruit_hub_dashboard/features/orders/domain/shiping_address_entity.dart';

import 'order_product__entity.dart';

class OrderEntity
{
  final double totalPrice;
  final String uID;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> products;
  final String paymentMethod;

  OrderEntity({required this.totalPrice, required this.uID, required this.shippingAddress, required this.products, required this.paymentMethod});



}
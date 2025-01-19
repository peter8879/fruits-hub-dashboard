import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_dashboard/features/orders/domain/order_entity.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrdersItemListView extends StatelessWidget {
  const OrdersItemListView({super.key, required this.orders});
  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return OrderItemWidget(orderModel: orders[index]);
      },
      itemCount: orders.length,
    );
  }
}

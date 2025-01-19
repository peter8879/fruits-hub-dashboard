import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/get_dummy_order.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';
import 'package:fruit_hub_dashboard/features/orders/presentation/views/widgets/orders_item_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterSection(),
        Expanded(
          child: OrdersItemListView(orders: [
            getDummyOrder(),
            getDummyOrder(),
          ]),
        )


      ],
    );
  }
}

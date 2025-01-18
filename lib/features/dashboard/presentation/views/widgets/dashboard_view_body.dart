import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
            width: double.infinity,
            child: CustomButton(
              text: 'Add Data',
              onPressed: (){
                Navigator.pushNamed(context, AddProductView.routeName);

              },
            ),
          )
        ],
      ),
    );
  }
}

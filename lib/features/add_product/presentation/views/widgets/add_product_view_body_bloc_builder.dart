import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cuibits/add_product_cubit/add_product_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cuibits/add_product_cubit/add_product_cubit.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if(state is AddProductSuccess){
          buildErrorBar(context, 'Product Added Successfully');
        }
        if(state is AddProductFailure){
          buildErrorBar(context, state.error);
        }

      },
      builder: (context, state) {

        return  ModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
            child: const AddProductViewBody(),
        );
      },
    );
  }
}
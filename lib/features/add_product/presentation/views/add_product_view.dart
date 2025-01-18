import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it__service.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cuibits/add_product_cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_builder.dart';

import '../../../../core/helper_functions/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'addProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(imagesRepo: getIt.get<ImagesRepo>(), productRepo:getIt.get<ProductRepo>() ),
        child: const AddProductViewBodyBlocBuilder(),
      ),
    );
  }


}



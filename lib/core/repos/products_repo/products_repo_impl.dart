import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/utils/back_end_end_points.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/add_product__input_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

import '../../services/data_base_service.dart';

class ProductsRepoImpl extends ProductRepo
{
  final DataBaseService dataBaseService;
  ProductsRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity) async{
   try{
    var result= await dataBaseService.addData(path: BackEndEndPoints.products, data: AddProductInputModel.fromEntity(addProductInputEntity).toMap());
    return right(result);
   }
   catch(e){
     return left(ServerFailure('Failed To Add Product'));
   }
  }

}
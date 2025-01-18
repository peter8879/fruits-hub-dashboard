import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo{
  Future<Either<Failure,void>> addProduct(AddProductInputEntity addProductInputEntity);
}
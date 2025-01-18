import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity
{
final String name,code,description;
final num price;
final bool isFeatured;
final File image;
 String? imageUrl;
 final int expirationMonths;
 final bool isOrganic;
 final int numberOfCalories;
 final int unitAmount;
 final num avgRating=0;
 final num ratingCount=0;
 final num sellingCount=0;
 final List<ReviewEntity> reviews;

  AddProductInputEntity(  {required this.name, required this.code, required this.description, required this.price, required this.isFeatured,  required this.image, this.imageUrl, required this.expirationMonths,  this.isOrganic=false, required this.numberOfCalories, required this.unitAmount,required this.reviews});

}
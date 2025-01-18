import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel extends AddProductInputEntity
{
  AddProductInputModel(  {required super.name, required super.code, required super.description, required super.price, required super.isFeatured, required super.image,super.imageUrl, required super.expirationMonths, super.isOrganic, required super.numberOfCalories, required super.unitAmount,required super.reviews});
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'code':code,
      'description':description,
      'price':price,
      'isFeatured':isFeatured,
      if(imageUrl!=null)
        'imageUrl':imageUrl,
      'expirationMonths':expirationMonths,
      'isOrganic':isOrganic,
      'numberOfCalories':numberOfCalories,
      'unitAmount':unitAmount,
      'ratingCount':ratingCount,
      'avgRating':avgRating,
      'sellingCount':sellingCount,
      'reviews':reviews.map((e) => ReviewModel.fromEntity(e).toMap()).toList()
    };
  }
  factory AddProductInputModel.fromEntity(AddProductInputEntity entity)
  {
    return AddProductInputModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      image: entity.image,
      imageUrl: entity.imageUrl,
      expirationMonths: entity.expirationMonths,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      reviews: entity.reviews
    );
  }

}
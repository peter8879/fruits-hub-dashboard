import 'package:fruit_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity
{
  ReviewModel({required super.name, required super.image, required super.rating, required super.date, required super.reviewDescription});
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'image':image,
      'rating':rating,
      'date':date,
      'reviewDescription':reviewDescription,
    };
  }
  factory ReviewModel.fromEntity(ReviewEntity entity)
  {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      date: entity.date,
      reviewDescription: entity.reviewDescription
    );
  }

}
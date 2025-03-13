import 'package:flutter_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num ratting;
  final String ratingDescription;
  final String date;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.ratingDescription,
      required this.date});

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
        name: entity.name,
        image: entity.image,
        ratting: entity.ratting,
        ratingDescription: entity.ratingDescription,
        date: entity.date);
  }

  Map<String, dynamic> toMap() {
    return {
      'name':name,
      'image':image,
      'ratting':ratting,
      'ratingDescription':ratingDescription,
      'date':date,
    };
  }
   toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescription': ratingDescription
    };
  }
}

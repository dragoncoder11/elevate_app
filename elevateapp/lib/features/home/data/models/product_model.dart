class ProductModel {
  final num id;
  final String title;
  final String? desc;
  final String? imageUrl;
  final num? price;
  final RatingModel? ratingModel;

  ProductModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.imageUrl,
      required this.price,
      required this.ratingModel});

  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        desc: json['description'],
        imageUrl: json['image'],
        price: json['price'],
        ratingModel: RatingModel.fromJson(json['rating']));
  }
}

class RatingModel {
  final num? rate;

  RatingModel({required this.rate});
  factory RatingModel.fromJson(json) {
    return RatingModel(rate: json['rate']);
  }
}

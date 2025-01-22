class  ItemsRespoceModel {
  int? id;
  String? title;
  double? price; // Ensure this is a double
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ItemsRespoceModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ItemsRespoceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] is int ? (json['price'] as int).toDouble() : json['price']?.toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
}

class Rating {
    double? rate;
    int? count;

    Rating({this.rate, this.count});

    Rating.fromJson(Map<String, dynamic> json) {
      rate = json['rate'] is int ? (json['rate'] as int).toDouble() : json['rate']?.toDouble(); // Explicit casting
      count = json['count'];
    }
  }


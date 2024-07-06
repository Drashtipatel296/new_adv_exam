// class DataModel{
//   int? id,price;
//   String? title,description,category,image;
//   Rating rating;
//
//   DataModel({this.id, this.price, this.title, this.description, this.category, this.image, this.rating});
//
//   factory DataModel.fromJson(Map json){
//     return DataModel(
//       id: json['id'],
//       price: json['price'],
//       title: json['title'],
//       description: json['description'],
//       category: json['category'],
//       image: json['image'],
//       rating: Rating()
//     );
//   }
// }
//
// class Rating{
//   int? rate, count;
//
//   Rating({this.rate, this.count});
//
//   factory Rating.fromJson(Map json){
//     return Rating(
//       rate: json['rate'],
//       count: json['count'],
//     );
//   }
// }


class DataModel {
  int? id;
  double? price;
  String? title, description, category, image;
  Rating? rating;

  DataModel({this.id, this.price, this.title, this.description, this.category, this.image, this.rating});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }

  static List<DataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DataModel.fromJson(json)).toList();
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] is int) ? (json['rate'] as int).toDouble() : json['rate'],
      count: json['count'],
    );
  }
}

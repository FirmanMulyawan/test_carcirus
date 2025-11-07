class CarModel {
  final String image;
  final String type;
  final String name;
  final String price;

  CarModel({
    required this.image,
    required this.type,
    required this.name,
    required this.price,
  });

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      image: map['image'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
    );
  }
}

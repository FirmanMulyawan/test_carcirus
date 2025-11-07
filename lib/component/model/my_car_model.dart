class MyCarModel {
  final int id;
  final String date;
  final String time;
  final String image;
  final String type;
  final String name;
  final String price;

  MyCarModel({
    required this.id,
    required this.date,
    required this.time,
    required this.image,
    required this.type,
    required this.name,
    required this.price,
  });

  factory MyCarModel.fromMap(Map<String, dynamic> map) {
    return MyCarModel(
      id: map['id'] ?? 0,
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      image: map['image'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
    );
  }
}

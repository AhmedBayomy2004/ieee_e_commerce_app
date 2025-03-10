class ProductResponce {
  final int id;
  final String title;
  final int price;
  final List<String> images;

  ProductResponce({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
  });

  factory ProductResponce.fromjson(Map<String, dynamic> json) {
    return ProductResponce(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      price: (json['price']) ?? 0,
      images: (json['images'])?.cast<String>() ?? [],
    );
  }
}

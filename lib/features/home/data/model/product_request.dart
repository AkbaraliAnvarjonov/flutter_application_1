class ProductRequest {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  ProductRequest({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    };
  }
}

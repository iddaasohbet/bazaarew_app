class Product {
  final int id;
  final String title;
  final String description;
  final String price;
  final String category;
  final String city;
  final int userId;
  final String? userName;
  final String? userPhone;
  final List<String> images;
  final String? createdAt;
  final String? status;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.city,
    required this.userId,
    this.userName,
    this.userPhone,
    this.images = const [],
    this.createdAt,
    this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String> imagesList = [];
    
    if (json['images'] != null) {
      if (json['images'] is String) {
        try {
          // Try to parse as JSON array
          final decoded = json['images'];
          if (decoded.startsWith('[')) {
            imagesList = List<String>.from(
              (decoded as String)
                  .replaceAll('[', '')
                  .replaceAll(']', '')
                  .replaceAll('"', '')
                  .split(',')
                  .where((s) => s.isNotEmpty)
                  .map((s) => s.trim())
            );
          } else {
            imagesList = [decoded];
          }
        } catch (e) {
          imagesList = [json['images']];
        }
      } else if (json['images'] is List) {
        imagesList = List<String>.from(json['images']);
      }
    }

    // Fallback to image field if images is empty
    if (imagesList.isEmpty && json['image'] != null && json['image'].toString().isNotEmpty) {
      imagesList = [json['image'].toString()];
    }

    return Product(
      id: int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '0',
      category: json['category'] ?? '',
      city: json['city'] ?? '',
      userId: int.parse(json['user_id'].toString()),
      userName: json['user_name'],
      userPhone: json['user_phone'],
      images: imagesList,
      createdAt: json['created_at'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'city': city,
      'user_id': userId,
      'user_name': userName,
      'user_phone': userPhone,
      'images': images,
      'created_at': createdAt,
      'status': status,
    };
  }

  String get mainImage {
    if (images.isNotEmpty) {
      return images[0];
    }
    return '';
  }
}








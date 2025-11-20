class Shop {
  final int id;
  final int userId;
  final String shopName;
  final String description;
  final String address;
  final String phone;
  final String? logo;
  final String? createdAt;

  Shop({
    required this.id,
    required this.userId,
    required this.shopName,
    required this.description,
    required this.address,
    required this.phone,
    this.logo,
    this.createdAt,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: int.parse(json['id'].toString()),
      userId: int.parse(json['user_id'].toString()),
      shopName: json['shop_name'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      logo: json['logo'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'shop_name': shopName,
      'description': description,
      'address': address,
      'phone': phone,
      'logo': logo,
      'created_at': createdAt,
    };
  }
}








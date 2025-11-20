class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String city;
  final bool isVerified;
  final String? role;
  final String? createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    this.isVerified = false,
    this.role,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: int.parse(json['id'].toString()),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      city: json['city'] ?? '',
      isVerified: json['is_verified'] == '1' || json['is_verified'] == 1 || json['is_verified'] == true,
      role: json['role'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'city': city,
      'is_verified': isVerified ? 1 : 0,
      'role': role,
      'created_at': createdAt,
    };
  }
}








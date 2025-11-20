class Message {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final int? productId;
  final String? productTitle;
  final bool isRead;
  final String createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    this.productId,
    this.productTitle,
    this.isRead = false,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: int.parse(json['id'].toString()),
      senderId: int.parse(json['sender_id'].toString()),
      receiverId: int.parse(json['receiver_id'].toString()),
      message: json['message'] ?? '',
      productId: json['product_id'] != null ? int.parse(json['product_id'].toString()) : null,
      productTitle: json['product_title'],
      isRead: json['is_read'] == '1' || json['is_read'] == 1 || json['is_read'] == true,
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'message': message,
      'product_id': productId,
      'product_title': productTitle,
      'is_read': isRead ? 1 : 0,
      'created_at': createdAt,
    };
  }
}








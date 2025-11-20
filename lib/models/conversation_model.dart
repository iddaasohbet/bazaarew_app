class Conversation {
  final int otherUserId;
  final String otherUserName;
  final String lastMessage;
  final String lastMessageTime;
  final int unreadCount;

  Conversation({
    required this.otherUserId,
    required this.otherUserName,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      otherUserId: int.parse(json['other_user_id'].toString()),
      otherUserName: json['other_user_name'] ?? 'Kullanıcı',
      lastMessage: json['last_message'] ?? '',
      lastMessageTime: json['last_message_time'] ?? '',
      unreadCount: json['unread_count'] != null ? int.parse(json['unread_count'].toString()) : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'other_user_id': otherUserId,
      'other_user_name': otherUserName,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'unread_count': unreadCount,
    };
  }
}








import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_config.dart';
import '../models/message_model.dart';
import '../models/conversation_model.dart';

class MessageService extends ChangeNotifier {
  List<Conversation> _conversations = [];
  List<Message> _messages = [];
  bool _isLoading = false;
  String? _error;

  List<Conversation> get conversations => _conversations;
  List<Message> get messages => _messages;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get conversations
  Future<void> getConversations(int userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.getConversations}&user_id=$userId'),
      );
      final data = json.decode(response.body);

      if (data['success'] == true) {
        _conversations = (data['conversations'] as List)
            .map((json) => Conversation.fromJson(json))
            .toList();
      } else {
        _error = data['message'] ?? 'Konuşmalar yüklenemedi';
      }
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get messages between two users
  Future<void> getMessages(int userId, int otherUserId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.getMessages}&user_id=$userId&other_user_id=$otherUserId'),
      );
      final data = json.decode(response.body);

      if (data['success'] == true) {
        _messages = (data['messages'] as List)
            .map((json) => Message.fromJson(json))
            .toList();
      } else {
        _error = data['message'] ?? 'Mesajlar yüklenemedi';
      }
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Send message
  Future<bool> sendMessage({
    required int senderId,
    required int receiverId,
    required String message,
    int? productId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.sendMessage),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'sender_id': senderId.toString(),
          'receiver_id': receiverId.toString(),
          'message': message,
          if (productId != null) 'product_id': productId.toString(),
        },
      );

      final data = json.decode(response.body);
      
      if (data['success'] == true) {
        // Refresh messages
        await getMessages(senderId, receiverId);
        return true;
      }
      return false;
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}








import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_config.dart';
import '../models/shop_model.dart';

class ShopService extends ChangeNotifier {
  Shop? _currentShop;
  bool _isLoading = false;
  String? _error;

  Shop? get currentShop => _currentShop;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get shop by user ID
  Future<void> getShop(int userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.getShop}&user_id=$userId'),
      );
      final data = json.decode(response.body);

      if (data['success'] == true && data['shop'] != null) {
        _currentShop = Shop.fromJson(data['shop']);
      } else {
        _currentShop = null;
      }
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update shop
  Future<bool> updateShop({
    required int userId,
    required String shopName,
    required String description,
    required String address,
    required String phone,
    String? logo,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(ApiConfig.updateShop),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': userId.toString(),
          'shop_name': shopName,
          'description': description,
          'address': address,
          'phone': phone,
          if (logo != null) 'logo': logo,
        },
      );

      final data = json.decode(response.body);

      if (data['success'] == true) {
        await getShop(userId); // Refresh shop data
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = data['message'] ?? 'Mağaza güncellenemedi';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}








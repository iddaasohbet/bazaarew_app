import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_config.dart';
import '../models/product_model.dart';

class ProductService extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _userProducts = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  List<Product> get userProducts => _userProducts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get all products
  Future<void> getProducts({String? category, String? search, String? city}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      String url = ApiConfig.getProducts;
      List<String> params = [];
      
      if (category != null && category.isNotEmpty) {
        params.add('category=$category');
      }
      if (search != null && search.isNotEmpty) {
        params.add('search=$search');
      }
      if (city != null && city.isNotEmpty) {
        params.add('city=$city');
      }
      
      if (params.isNotEmpty) {
        url += '&${params.join('&')}';
      }

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      if (data['success'] == true) {
        _products = (data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        _error = data['message'] ?? 'Ürünler yüklenemedi';
      }
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get single product
  Future<Product?> getProduct(int id) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.getProduct}&id=$id'),
      );
      final data = json.decode(response.body);

      if (data['success'] == true) {
        return Product.fromJson(data['product']);
      }
      return null;
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
      notifyListeners();
      return null;
    }
  }

  // Get user products
  Future<void> getUserProducts(int userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.getUserProducts}&user_id=$userId'),
      );
      final data = json.decode(response.body);

      if (data['success'] == true) {
        _userProducts = (data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        _error = data['message'] ?? 'Ürünler yüklenemedi';
      }
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add product
  Future<bool> addProduct({
    required String title,
    required String description,
    required String price,
    required String category,
    required String city,
    required int userId,
    List<String>? imagePaths,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(ApiConfig.addProduct),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'title': title,
          'description': description,
          'price': price,
          'category': category,
          'city': city,
          'user_id': userId.toString(),
          if (imagePaths != null) 'images': json.encode(imagePaths),
        },
      );

      final data = json.decode(response.body);

      if (data['success'] == true) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = data['message'] ?? 'Ürün eklenemedi';
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

  // Update product
  Future<bool> updateProduct({
    required int id,
    required String title,
    required String description,
    required String price,
    required String category,
    required String city,
    List<String>? imagePaths,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(ApiConfig.updateProduct),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'id': id.toString(),
          'title': title,
          'description': description,
          'price': price,
          'category': category,
          'city': city,
          if (imagePaths != null) 'images': json.encode(imagePaths),
        },
      );

      final data = json.decode(response.body);
      _isLoading = false;
      notifyListeners();

      return data['success'] == true;
    } catch (e) {
      _error = 'Bağlantı hatası: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Delete product
  Future<bool> deleteProduct(int id) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.deleteProduct),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'id': id.toString()},
      );

      final data = json.decode(response.body);
      
      if (data['success'] == true) {
        _products.removeWhere((p) => p.id == id);
        _userProducts.removeWhere((p) => p.id == id);
        notifyListeners();
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








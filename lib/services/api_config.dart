class ApiConfig {
  // API Base URL
  static const String baseUrl = 'https://bazaarewatan.com/api';
  
  // API Endpoints
  static const String login = '$baseUrl/auth.php?action=login';
  static const String register = '$baseUrl/auth.php?action=register';
  static const String verifyOtp = '$baseUrl/auth.php?action=verify_otp';
  static const String forgotPassword = '$baseUrl/auth.php?action=forgot_password';
  static const String changePassword = '$baseUrl/change-password.php';
  
  static const String getProducts = '$baseUrl/products.php?action=get';
  static const String getProduct = '$baseUrl/products.php?action=get_single';
  static const String addProduct = '$baseUrl/products.php?action=add';
  static const String updateProduct = '$baseUrl/products.php?action=update';
  static const String deleteProduct = '$baseUrl/products.php?action=delete';
  static const String getUserProducts = '$baseUrl/products.php?action=get_user_products';
  
  static const String getCategories = '$baseUrl/categories.php?action=get';
  
  static const String getShop = '$baseUrl/shops.php?action=get';
  static const String updateShop = '$baseUrl/shops.php?action=update';
  
  static const String getMessages = '$baseUrl/messages.php?action=get';
  static const String sendMessage = '$baseUrl/messages.php?action=send';
  static const String getConversations = '$baseUrl/messages.php?action=conversations';
  
  static const String uploadImage = '$baseUrl/upload.php';
  
  static const String getUsers = '$baseUrl/users.php?action=get';
  static const String updateUser = '$baseUrl/users.php?action=update';
  
  // Image Base URL
  static const String imageBaseUrl = 'https://bazaarewatan.com/images/';
  
  // Helper function to get full image URL
  static String getImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return ''; // Placeholder will be used
    }
    if (imagePath.startsWith('http')) {
      return imagePath;
    }
    return imageBaseUrl + imagePath;
  }
}


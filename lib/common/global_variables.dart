const String _baseUrl = 'https://restaurant-api.dicoding.dev';

class GlobalVariables {
  static const baseUrl = _baseUrl;

  static const ImageUrl image = ImageUrl._();
}

class ImageUrl {
  const ImageUrl._();

  String small(String id) {
    return '$_baseUrl/images/small/$id';
  }

  String medium(String id) {
    return '$_baseUrl/images/medium/$id';
  }

  String large(String id) {
    return '$_baseUrl/images/large/$id';
  }
}

class ApiEndPoints {
  //https://ecommerce.routemisr.com/api/v1/auth/signup

  static const String baseUrl = 'ecommerce.routemisr.com';
  static const String registerEndPoint = '/api/v1/auth/signup';
  static const String loginEndPoint = '/api/v1/auth/signin';
  static const String allCategoriesEndPoint = 'api/v1/categories';
  static const String allBrandsEndPoint = '/api/v1/brands';
  static const String allProductsEndPoint = '/api/v1/products';
  static const String addToCartEndPoint = '/api/v1/cart';
  static const String getAndAddToWishListEndPoint = '/api/v1/wishlist';
  static const String removeWishListEndPoint = '/api/v1/wishlist/';
  static const String API_KEY =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RjMk9EQTRMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkudjNqb1c3UUFEVXBYdk8zLXJ4dGRiSV90enBBZm51N0NKQzZFbU1NcHFvR2wzd2c2UUFyLUdfXzY0dVEwQmtHV2hnXzhoNVNLSE8wRGttN3lWZlQtbmc=';

  static String removeFromCartEndPoint({required String id}) =>
      '/api/v1/cart/$id';

  static String subCategoriesEndPoint({required String id}) =>
      '/api/v1/categories/$id/subcategories';
}

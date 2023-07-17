import 'package:flutter/material.dart';
import 'package:ozb_cli/repo/api_status.dart';
import 'package:ozb_cli/repo/product_service.dart';

import '../models/product_list_model.dart';

class ProductViewModel extends ChangeNotifier {
  bool _loading = false;
  List<ProductList> _productListModel = [];
  // ProductError _productError;

  bool get loading => _loading;
  List<ProductList> get productListModel => _productListModel;
  // ProductError get userError => _productError;

  setloading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setProductListModel(List<ProductList> productlistModel) {
    _productListModel = productlistModel;
  }
  // setProductError (ProductError productError ){
  //   _productError = productError;
  // }

  ProductViewModel() {
    getProducts();
  }

  getProducts() async {
    setloading(true);
    var response = await ProductService.getProducts();

    if (response is Success) {
      setProductListModel(response);
    }
    // if(response is Failure){
    //   ProductError productError = ProductError(code: response.code, message: response.errorResponse);

    //   setProductError(productError);
    // }

    setloading(false);
  }

  // List<String> favoriteProducts = [];

  // void addFavorite(String title) {
  //   if (!favoriteProducts.contains(title)) {
  //     favoriteProducts.add(title);
  //   }
  // }

  // void removeFavorite(String title) {
  //   favoriteProducts.remove(title);
  // }

  // List<ProductList> getFavoriteProducts() {
  //   return _productListModel
  //       .where((product) => favoriteProducts.contains(product.title))
  //       .toList();
  // }
}

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
      setProductListModel(response.response as List<ProductList>);
    }
    // if(response is Failure){
    //   ProductError productError = ProductError(code: response.code, message: response.errorResponse);

    //   setProductError(productError);
    // }

    setloading(false);
  }
}

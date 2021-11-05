import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];

  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  isWishlist(ProductModel product) {
    if (_wishlist.indexWhere((e) => e.id == product.id) != -1) {
      return true;
    } else {
      return false;
    }
  }

  printWishlist() {
    for (int i = 0; i < _wishlist.length; i++) {
      print(_wishlist[i].name);
    }
  }
}

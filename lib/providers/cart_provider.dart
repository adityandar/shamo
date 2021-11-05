import 'package:flutter/cupertino.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  //TODO: ada masalah di bagian cart yaitu harusnya ketika dihapus, yang bawah tetep bisa dihapus. sekarang dia ngebug gitu karena removeat(id) bakal geser semua produk di bawah buat naek ke atas.
  //TODO: ada di video untuk buktinya, di desktop judulnya "bug".
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (isExist(product)) {
      int idx =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[idx].quantity++;
    } else {
      _carts.add(CartModel(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  int totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  double totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.product.price);
    }
    return total;
  }

  isExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) !=
        -1) {
      return true;
    } else {
      return false;
    }
  }
}

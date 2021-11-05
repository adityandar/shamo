import 'package:shamo/models/product_model.dart';

class CartModel {
  int id;
  ProductModel product;
  int quantity;

  CartModel({
    this.id,
    this.product,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.product = ProductModel.fromJson(json['product']);
    this.quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}

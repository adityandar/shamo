import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(cart.product.galleries[0].url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product.name,
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Text("\$${cart.product.price.toString()}", style: priceTextStyle),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        cartProvider.addQuantity(cart.id);
                      },
                      child: Image.asset("assets/button_add.png", width: 16)),
                  Text(cart.quantity.toString(),
                      style: primaryTextStyle.copyWith(fontWeight: medium)),
                  GestureDetector(
                      onTap: () {
                        cartProvider.reduceQuantity(cart.id);
                      },
                      child: Image.asset("assets/button_min.png", width: 16)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: alertColor,
                  size: 12,
                ),
                SizedBox(width: 4),
                Text(
                  'Remove',
                  style:
                      alertTextStyle.copyWith(fontWeight: light, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

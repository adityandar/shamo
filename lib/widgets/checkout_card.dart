import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;

  CheckoutCard(this.cart);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cart.product.galleries[0].url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text("\$${cart.product.price.toString()}",
                    style: priceTextStyle),
              ],
            ),
          ),
          Text(
            (cart.quantity == 1)
                ? '${cart.quantity} Item'
                : '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

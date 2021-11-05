import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget header() {
      return AppBar(
        elevation: 0,
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          // NOTE: LIST ITEMS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                Column(
                  children: cartProvider.carts
                      .map((cart) => CheckoutCard(cart))
                      .toList(),
                ),
              ],
            ),
          ),

          // NOTE: ADDRESS DETAILS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/icon_store_location.png"),
                      width: 40,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: secondaryTextStyle.copyWith(
                              fontWeight: light, fontSize: 12),
                        ),
                        Text(
                          'Adidas Core',
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Image(
                    image: AssetImage("assets/icon_line.png"),
                    height: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/icon_your_address.png"),
                      width: 40,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Address',
                          style: secondaryTextStyle.copyWith(
                              fontWeight: light, fontSize: 12),
                        ),
                        Text(
                          'Marsemoon',
                          style: primaryTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: PAYMENT SUMMARY
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      (cartProvider.totalItems() == 1)
                          ? '1 item'
                          : '${cartProvider.totalItems().toString()} Items',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xFF2E3141),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: priceTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30),
          Divider(
            thickness: 1,
            color: Color(0xFF2E3141),
          ),
          SizedBox(height: 30),

          // NOTE: CHECKOUT BUTTON
          Container(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/checkout-success', (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Checkout Now',
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
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
          'Your Cart',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon_cart_big.png",
              width: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Opss! Your Cart is Empty',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle,
            ),
            SizedBox(height: 30),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: cartProvider.carts.map((e) {
          if (e.id != -1) {
            return CartCard(e);
          } else {
            return SizedBox();
          }
        }).toList(),
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 160,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: primaryTextStyle),
                  Text(
                    cartProvider.totalPrice().toString(),
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, color: Color(0xFF2B2938)),
            SizedBox(height: 20),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: (cartProvider.carts.length == 0) ? emptyCart() : content(),
      bottomNavigationBar:
          (cartProvider.carts.length == 0) ? SizedBox() : customBottomNav(),
    );
  }
}

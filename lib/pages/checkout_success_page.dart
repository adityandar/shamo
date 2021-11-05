import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
        ),
        elevation: 0,
      );
    }

    Widget content() {
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
              'You made a transaction',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Stay at home while we \nprepare your dream shoes',
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Container(
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
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
                  'Order Other Shoes',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: 196,
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF39374B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  'View My Order',
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

    return Scaffold(
      appBar: header(),
      backgroundColor: backgroundColor3,
      body: content(),
    );
  }
}

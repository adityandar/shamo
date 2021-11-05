import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text("Favorite Shoes"),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 74,
                color: secondaryColor,
              ),
              SizedBox(height: 23),
              Text(
                'You don\'t have dream shoes?',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(height: 12),
              Text(
                'Let\'s find your favorite shoes',
                style: secondaryTextStyle,
              ),
              SizedBox(height: 20),
              Container(
                height: 44,
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  child: Text(
                    "Explore Store",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              children: wishlistProvider.wishlist.map((product) {
                return WishlistCard(product);
              }).toList(),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyWishlist(),
        (wishlistProvider.wishlist.isEmpty) ? emptyWishlist() : content(),
      ],
    );
  }
}

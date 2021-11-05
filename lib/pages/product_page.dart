import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xFFC4C4C4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        margin: EdgeInsets.only(right: 16),
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries
                .map(
                  (image) => Image.network(
                    image.url,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE: HEADER
            Container(
              margin: EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin, defaultMargin, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        widget.product.category.name,
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to the wishlist!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Has been removed from the wishlist!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image(
                      image: AssetImage(
                        (wishlistProvider.isWishlist(widget.product))
                            ? 'assets/button_wishlist_active.png'
                            : 'assets/button_wishlist.png',
                      ),
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),

            //NOTE: PRICE
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                  ),
                ],
              ),
            ),

            // NOTE: DESCRIPTION
            Container(
              margin: EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin, defaultMargin, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.product.description,
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                  ),
                ],
              ),
            ),

            // NOTE: FAMILIAR SHOES
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map(
                        (e) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                                left: (index == 0) ? defaultMargin : 0),
                            child: familiarShoesCard(e),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // NOTE: BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/button_chat.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          //TODO: Harusnya ada dialog pop up yang muncul tapi gatau dari episode berapa (?)
                          cartProvider.addCart(widget.product);
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFECEDEF),
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}

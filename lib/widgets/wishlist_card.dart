import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;

  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(12, 10, 20, 14),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: NetworkImage(product.galleries[0].url),
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "\$${product.price.toString()}",
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Ink(
              //gimana caranya supaya udah dikasih backgroundcolor di parent(container) tetep bisa taroh ink???
              //pake material ternyata
              decoration: ShapeDecoration(
                color: secondaryColor,
                shape: CircleBorder(),
              ),
              width: 34,
              height: 34,
              child: IconButton(
                icon: Icon(Icons.favorite, size: 14),
                color: Colors.white,
                onPressed: () {
                  wishlistProvider.setProduct(this.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: alertColor,
                      content: Text(
                        'Has been removed from the wishlist!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

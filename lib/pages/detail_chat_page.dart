import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  Widget header() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Image(
              image: AssetImage("assets/image_logo_shop.png"),
              width: 50,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoe Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: light),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chatInput() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productPreview(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Type Message...',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/icon_submit.png"),
                    width: 23,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget productPreview() {
    return Container(
      width: 225,
      height: 74,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor5,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: AssetImage("assets/image_shoes2.png"),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Predator 20.3 Firm Ground',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  '\$68,47',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Icon(
                Icons.close,
                size: 22,
                color: backgroundColor3,
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
      children: [
        ChatBubble(
          text: 'Hi, This item is still available?',
          isSender: true,
          hasProduct: true,
        ),
        ChatBubble(
          text: 'Good night, This item is only available in size 42 and 43',
        ),
        ChatBubble(
          text: 'Owww, it suits me very well',
          isSender: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}

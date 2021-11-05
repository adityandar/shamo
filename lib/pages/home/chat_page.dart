import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  Widget header() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor1,
    );
  }

  Widget emptyChat() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/icon_customer_service.png"),
              width: 80,
              color: secondaryColor,
            ),
            SizedBox(height: 20),
            Text(
              'Opss no message yet?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(height: 20),
            Container(
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            SizedBox(height: 20),
            ChatTile(),
            ChatTile(),
            ChatTile(),
            ChatTile(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}

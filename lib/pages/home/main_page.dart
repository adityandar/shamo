import 'package:flutter/material.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          backgroundColor: secondaryColor,
          child: Image.asset("assets/icon_cart.png", width: 20),
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      "assets/icon_home.png",
                      width: 21,
                      color: currentIndex == 0 ? primaryColor : inactiveColor,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      "assets/icon_chat.png",
                      width: 20,
                      color: currentIndex == 1 ? primaryColor : inactiveColor,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      "assets/icon_wishlist.png",
                      width: 20,
                      color: currentIndex == 2 ? primaryColor : inactiveColor,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      "assets/icon_profile.png",
                      width: 18,
                      color: currentIndex == 3 ? primaryColor : inactiveColor,
                    ),
                  ),
                  label: ''),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      extendBody: true,
      body: body(),
    );
  }
}

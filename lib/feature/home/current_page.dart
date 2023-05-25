import 'package:flutter/material.dart';
import 'package:package/core/style/theme.dart';
import 'package:package/feature/cart/cart_page.dart';
import 'package:package/feature/chat/chat_page.dart';
import 'package:package/feature/home/home_page.dart';
import 'package:package/feature/profile/profile_page.dart';
import 'package:package/feature/wishList/wishlist_page.dart';

class CurrentPage extends StatefulWidget {
  static String rootName = '/current-page';
  const CurrentPage({Key? key}) : super(key: key);

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  int _currentPage = 0;
  Widget _customFLoating(Function() onTap) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: secondaryColor,
      onPressed: onTap,
      child: Image.asset(
        'assets/Cart Icon.png',
        width: 20,
      ),
    );
  }

  final List _listPageDashboar = [
    HomePage(),
    const ChatPage(),
    const WishListPage(),
    const ProfilePage()
  ];

  Widget _body() {
    return _listPageDashboar[_currentPage];
  }

  Widget _customNavbar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: SizedBox(
        height: 65,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          color: backgroundColor4,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: _currentPage,
            onTap: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(
                    'assets/icon_navbar_home.png',
                    color: _currentPage == 0 ? primaryColor : Color(0xFF808191),
                    width: 21,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(
                    'assets/icon_navbar_chat.png',
                    color: _currentPage == 1 ? primaryColor : Color(0xFF808191),
                    width: 20,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(
                    'assets/icon_navbar_fav.png',
                    color: _currentPage == 2 ? primaryColor : Color(0xFF808191),
                    width: 20,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(
                    'assets/icon_navbar_profile.png',
                    color: _currentPage == 3 ? primaryColor : Color(0xFF808191),
                    width: 18,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            _currentPage == 0 ? backgroundColor1 : backgroundColor3,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _customNavbar(),
        floatingActionButton: _customFLoating(
          () => Navigator.pushNamed(context, CartPage.rootName),
        ),
        body: _body(),
      ),
    );
  }
}

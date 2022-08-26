import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account/account_page.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/pages/cart/cart_history.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  List pages =[
    MainFoodPage(),
    SignUpPage(),
    CartHistory(),
    AccountPage(),
  ];

  void onTapNav(int index){
    setState(() {
      _selectIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive,),
              label: "History"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,),
              label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: "Me"
          ),

        ],
      ),
    );
  }
}

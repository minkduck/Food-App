import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_layout.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:gap/gap.dart';

import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Profile",size: 24, color: Colors.white,),
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
      ),
      body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height20),
          child: Column(

            children: [
              //profile icon
              AppIcon(icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: AppLayout.getHeight(75),
                size: AppLayout.getHeight(150),
              ),
              Gap(Dimensions.height30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //name
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: AppLayout.getHeight(25),
                            size: AppLayout.getHeight(50),
                          ),
                          bigText: BigText(text: "Mink Duck")
                      ),
                      Gap(Dimensions.height20),
                      //phone
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.phone,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconSize: AppLayout.getHeight(25),
                            size: AppLayout.getHeight(50),
                          ),
                          bigText: BigText(text: "0935435942")
                      ),
                      Gap(Dimensions.height20),
                      //email
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.email,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconSize: AppLayout.getHeight(25),
                            size: AppLayout.getHeight(50),
                          ),
                          bigText: BigText(text: "MinkDuck@gmail.com")
                      ),
                      Gap(Dimensions.height20),
                      //address
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.location_on,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconSize: AppLayout.getHeight(25),
                            size: AppLayout.getHeight(50),
                          ),
                          bigText: BigText(text: "Fill in your address")
                      ),
                      Gap(Dimensions.height20),
                      //message
                      AccountWidget(
                          appIcon: AppIcon(icon: Icons.message_outlined,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: AppLayout.getHeight(25),
                            size: AppLayout.getHeight(50),
                          ),
                          bigText: BigText(text: "Mink Duck")
                      ),
                      Gap(Dimensions.height20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

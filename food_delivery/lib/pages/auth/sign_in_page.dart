import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/app_layout.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Gap(Dimensions.screenHeight * 0.05),
            // app logo
            SizedBox(
              height: Dimensions.screenHeight * 0.25,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/logo_1.png"),
                ),
              ),
            ),
            //welcome
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign into your account',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Gap(Dimensions.screenHeight * 0.05),
            //your email
            AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            Gap(Dimensions.height20),
            //your password
            AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp),
            Gap(Dimensions.height20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Gap(10),
                Text(
                  'Forgot your password ?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            Gap(Dimensions.height20),
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor),
              child: Center(
                child: BigText(
                  text: "Log In",
                  size: AppLayout.getHeight(30),
                  color: Colors.white,
                ),
              ),
            ),
            Gap(Dimensions.height20),

            RichText(
                text: TextSpan(
                    text: "Don\'t have an account ?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 20,
                    ),
                    children: [
                  TextSpan(
                      text: "  Create",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const SignUpPage(),
                            transition: Transition.fade))
                ]))
          ],
        ),
      ),
    );
  }
}

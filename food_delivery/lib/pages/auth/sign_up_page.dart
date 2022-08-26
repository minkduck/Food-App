import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/data/controllers/auth_controller.dart';
import 'package:food_delivery/models/signup_body_models.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/utils/app_layout.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    List images = ["g.png", "t.png", "f.png"];
    void _registration(){
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty){
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email address", title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "password");
      }else if (password.length < 6){
        showCustomSnackBar("Password can not be less than six characters", title: "Password");
      }else {
        showCustomSnackBar("All went well", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
            name: name,
            phone: phone,
            email: email,
            password: password);
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("Success registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

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
            //your name
            AppTextField(
                textController: nameController,
                hintText: "Name",
                icon: Icons.person),
            Gap(Dimensions.height20),
            //your phone
            AppTextField(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.phone),
            Gap(Dimensions.height20),
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor),
                child: Center(
                  child: BigText(
                    text: "Sign up",
                    size: AppLayout.getHeight(30),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Gap(Dimensions.height10),
            RichText(
                text: TextSpan(
                    text: "Have an account?",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => const SignInPage(), transition: Transition.fade))),
            Gap(Dimensions.height10),
            RichText(
                text: TextSpan(
              text: "Sign up using one of the following methods",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            )),
            Gap(Dimensions.height10),
            Wrap(
                children: List<Widget>.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[500],
                  radius: 30,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage("assets/images/" + images[index]),
                  ),
                ),
              );
            }))
          ],
        ),
      ),
    );

  }
}

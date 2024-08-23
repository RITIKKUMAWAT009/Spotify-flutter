import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_lite/common/helpers/is_dark_mode.dart';
import 'package:spotify_lite/common/widgets/appbar/app_bar.dart';
import 'package:spotify_lite/core/configs/assets/app_images.dart';
import 'package:spotify_lite/core/configs/assets/app_vectors.dart';
import 'package:spotify_lite/presentation/auth/pages/signIn.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/themes/app_colors.dart';
import 'sign_up.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topUnion,
              width: 500,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.union,
              width: 300,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBg,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.splash,
                    color: AppColors.primary,
                  ),
                  55.heightBox,
                  const Text(
                    "Enjoy Listining to Music",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  21.heightBox,
                  const Text(
                    textAlign: TextAlign.center,
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 17,
                    ),
                  ),
                  41.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: BasicAppButton(
                          title: "Sign Up",
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return  SignUpPage();
                            },));
                          },
                        ),
                      ),
                      20.widthBox,
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context) {
                            return  SigninPage();
                          },));
                        },
                        child:  Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color:context.isDarkOrNot?AppColors.white: AppColors.black
                          ),
                        ),
                      ))
                    ],
                  ),
                  40.heightBox,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

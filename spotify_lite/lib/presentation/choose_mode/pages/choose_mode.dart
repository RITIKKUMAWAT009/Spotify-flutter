import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_lite/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_lite/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/themes/app_colors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 14),
            decoration: const BoxDecoration(
                image: DecorationImage(filterQuality: FilterQuality.high,
                    image: AssetImage(AppImages.chooseModeBG), fit: BoxFit.fill)),
            child: Column(
              children: [
                20.heightBox,
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.splash,color: AppColors.primary,)),
                const Spacer(),
                const Text(
                  "Choose Mode",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                 Column(
                   children: [
                     GestureDetector(
                       onTap: () {
                         context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                       },
                       child: ClipOval(
                         child: BackdropFilter(
                           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                           child: Container(
                             height: 80,
                             width: 80,
                             decoration:BoxDecoration(
                               shape: BoxShape.circle,
                               color: const Color(0xff30393C).withOpacity(0.5),
                             ),
                             child:SvgPicture.asset(AppVectors.moon,fit: BoxFit.none,),
                           ),
                         ),
                       ),
                     ),
                     15.heightBox,
                     const Text(
                       "Dark Mode",
                       style: TextStyle(
                           color: AppColors.grey,
                           fontWeight: FontWeight.w500,
                           fontSize: 16),
                     ),
                   ],
                 ),
                  40.widthBox,
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration:BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff30393C).withOpacity(0.5),
                              ),
                              child: SvgPicture.asset(AppVectors.sun,fit: BoxFit.none,),
                            ),
                          ),
                        ),
                      ),
                      15.heightBox,
                      const Text(
                        "Light Mode",
                        style: TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
                50.heightBox,
                BasicAppButton(
                    title: "Continue",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignupOrSignin();
                        },
                      ));
                    }),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

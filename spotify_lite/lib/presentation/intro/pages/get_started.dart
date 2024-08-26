import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_lite/common/dummy/dummy.dart';
import 'package:spotify_lite/common/widgets/button/basic_app_button.dart';
import 'package:spotify_lite/core/configs/assets/app_images.dart';
import 'package:spotify_lite/core/configs/themes/app_colors.dart';
import 'package:spotify_lite/presentation/choose_mode/pages/choose_mode.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/configs/assets/app_vectors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 14),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.introBG), fit: BoxFit.fill)),
            child: Column(
              children: [
                30.heightBox,
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.splash)),
                50.heightBox,
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style:  const TextStyle(
                      fontSize: 20.0,fontWeight: FontWeight.bold,
                      fontFamily: 'Agne',
                    ),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                     repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText('Design and Developed by',textAlign: TextAlign.center,speed: const Duration(milliseconds:100)),
                        TypewriterAnimatedText(' Ritik kumawat',textAlign: TextAlign.center,speed: const Duration(milliseconds:100),textStyle: TextStyle(color: AppColors.primary),),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                21.heightBox,
                const Text(
                  textAlign: TextAlign.center,
                  "Get access to millions of songs from artists you follow and artists you know yourself to enjoy on your device anywhere. No matter where you are on your device or what device you use to listen to music on the go.",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
                Container(
                  color: Colors.black.withOpacity(0.15),
                ),
                20.heightBox,
                BasicAppButton(
                    title: "Get Started",
                    onPressed: ()async{
                     // await  uploadToCloud(DummySong.songs);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ChooseModePage();
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

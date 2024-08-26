import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_lite/presentation/root/pages/home_page.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }
  Future<void> redirect() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        if(FirebaseAuth.instance.currentUser != null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage(),));
        }else if(FirebaseAuth.instance.currentUser == null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const GetStartedPage(),));
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.splash),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_lite/data/models/auth/sign_in_user_request.dart';
import 'package:spotify_lite/domian/usecases/auth/signin.dart';
import 'package:spotify_lite/presentation/auth/pages/sign_up.dart';
import 'package:spotify_lite/presentation/root/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../service_locator.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.splash,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signInText(),
                50.heightBox,
                _emailField(context),
                20.heightBox,
                _passwordField(context),
                40.heightBox,
                BasicAppButton(title: "Sign In", onPressed: ()async{
                  var result=await sl<SigninUseCase>().call(
                    params:SignInUserRequest(email:emailController.text, password:passwordController.text)
                  );
                  result.fold(
                      (l){
                        var snackbar=SnackBar(content:Text(l),elevation: 10,backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);},
                      (r){
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context) =>HomePage(),),(route) => false,);
                      }
                  );
                }),
                Spacer(),
                _signinText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      "Sign In",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(hintText: "Enter Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller:passwordController,
      decoration: const InputDecoration(hintText: "Password")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          10.widthBox,
          TextButton(child: const Text("Sign Up"), onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
              return  SignUpPage();
            }));
          }),
        ],
      ),
    );
  }
}

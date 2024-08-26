import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_lite/data/models/auth/create_user_req.dart';
import 'package:spotify_lite/data/models/auth/sign_in_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SignInUserRequest req);

  Future<Either> signUp(CreateUserReq req);

  Future<void> signOut();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserRequest req) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: req.email, password: req.password);
      return const Right("Sign in was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "user-not-found") {
        message = "No user found for that email";
      } else if (e.code == "invalid-email") {
        message = "Invalid email provided for that user";
      } else if (e.code == "wrong-password") {
        message = "Wrong password provided for that user";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq req) async {
    try {
    var userCredential=  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: req.email, password: req.password);
    FirebaseFirestore.instance.collection("Users").add(
      {
        "fullName":req.fullName,
        "email":userCredential.user?.email
      }
    );
      return const Right("Sign up was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "Password is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "The account already exists for that email";
      }
      return Left(message);
    }
  }

  @override
  Future<void> signOut() async {}
}

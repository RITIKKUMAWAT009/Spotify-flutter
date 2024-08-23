import 'package:dartz/dartz.dart';
import 'package:spotify_lite/data/models/auth/create_user_req.dart';
import 'package:spotify_lite/data/models/auth/sign_in_user_request.dart';

abstract class AuthRepo{
  Future<Either> signIn(SignInUserRequest req);
  Future<Either> signUp(CreateUserReq req);
  Future<void> signOut();
}
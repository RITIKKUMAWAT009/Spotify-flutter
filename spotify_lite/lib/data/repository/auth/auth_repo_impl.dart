import 'package:dartz/dartz.dart';
import 'package:spotify_lite/data/models/auth/create_user_req.dart';
import 'package:spotify_lite/data/models/auth/sign_in_user_request.dart';
import 'package:spotify_lite/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_lite/domian/entities/auth/user.dart';
import 'package:spotify_lite/domian/repository/auth/auth_repo.dart';

import '../../../service_locator.dart';

class AuthRepoImpl extends AuthRepo{
  @override
  Future<Either> signIn(SignInUserRequest req) async{
return await sl<AuthFirebaseService>().signIn(req);
  }

  @override
  Future<void> signOut()async {

  }

  @override
  Future<Either> signUp(CreateUserReq req) async{
return await sl<AuthFirebaseService>().signUp(req);
  }

}
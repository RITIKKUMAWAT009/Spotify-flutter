import 'package:dartz/dartz.dart';
import 'package:spotify_lite/data/models/auth/create_user_req.dart';
import 'package:spotify_lite/data/models/auth/sign_in_user_request.dart';
import 'package:spotify_lite/domian/repository/auth/auth_repo.dart';
import 'package:spotify_lite/service_locator.dart';

import '../../../core/usecases/usecase.dart';

class SigninUseCase implements UseCase<Either,SignInUserRequest>{
  @override
  Future<Either> call({SignInUserRequest? params}) {
    return sl<AuthRepo>().signIn(params!);
  }
}
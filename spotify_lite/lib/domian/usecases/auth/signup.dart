import 'package:dartz/dartz.dart';
import 'package:spotify_lite/data/models/auth/create_user_req.dart';
import 'package:spotify_lite/domian/repository/auth/auth_repo.dart';
import 'package:spotify_lite/service_locator.dart';

import '../../../core/usecases/usecase.dart';

class SignupUseCase implements UseCase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepo>().signUp(params!);
  }
}
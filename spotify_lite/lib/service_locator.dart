import 'package:get_it/get_it.dart';
import 'package:spotify_lite/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify_lite/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_lite/domian/repository/auth/auth_repo.dart';
import 'package:spotify_lite/domian/usecases/auth/signin.dart';
import 'package:spotify_lite/domian/usecases/auth/signup.dart';

final sl=GetIt.instance;

Future<void>initializeDependencies()async{
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepo>(AuthRepoImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}

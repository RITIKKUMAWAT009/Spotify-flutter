import 'package:get_it/get_it.dart';
import 'package:spotify_lite/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify_lite/data/repository/song/song_repository_impl.dart';
import 'package:spotify_lite/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_lite/data/sources/song/song_firebase_service.dart';
import 'package:spotify_lite/domian/repository/auth/auth_repo.dart';
import 'package:spotify_lite/domian/repository/song/song_repo.dart';
import 'package:spotify_lite/domian/usecases/auth/signin.dart';
import 'package:spotify_lite/domian/usecases/auth/signup.dart';
import 'package:spotify_lite/domian/usecases/song/get_news_songs.dart';
import 'package:spotify_lite/domian/usecases/song/get_play_list.dart';

final sl=GetIt.instance;
Future<void>initializeDependencies()async{
  /// [SOURCES]
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImp());


  /// [REPOSITORY]
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());
  sl.registerSingleton<SongRepo>(SongRepositoryImpl());


  /// [USECASES]
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());

  // sl.registerSingleton<SignupUseCase>(SignupUseCase(sl<AuthRepo>()));
  // sl.registerSingleton<SigninUseCase>(SigninUseCase(sl<AuthRepo>()));
  // sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase(sl<SongRepo>()));



}

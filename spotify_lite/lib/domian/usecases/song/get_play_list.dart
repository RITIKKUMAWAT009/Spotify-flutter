import 'package:dartz/dartz.dart';
import 'package:spotify_lite/domian/repository/song/song_repo.dart';

import '../../../core/usecases/usecase.dart';
import '../../../service_locator.dart';

class GetPlayListUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params})async {
  return await sl<SongRepo>().getPlayList();
  }

}
import 'package:dartz/dartz.dart';
import 'package:spotify_lite/data/repository/song/song_repository_impl.dart';

import '../../../core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/song/song_repo.dart';

class GetNewsSongsUseCase implements UseCase<Either,dynamic>{

  @override
  Future<Either> call({params}) async{
    return await sl<SongRepo>().getNewsSongs();
  }
}
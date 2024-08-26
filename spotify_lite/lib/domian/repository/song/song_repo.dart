import 'package:dartz/dartz.dart';

abstract class SongRepo{
  Future<Either>getNewsSongs();
  Future<Either>getPlayList();
}
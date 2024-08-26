import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/common/helpers/is_dark_mode.dart';
import 'package:spotify_lite/core/configs/constants/app_constants.dart';
import 'package:spotify_lite/core/configs/themes/app_colors.dart';
import 'package:spotify_lite/presentation/root/bloc/news_songs_cubit.dart';
import 'package:spotify_lite/presentation/root/bloc/news_songs_state.dart';
import 'package:spotify_lite/presentation/song_player/pages/song_player_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../domian/entities/song/song_entity.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NewsSongsCubit()..getNewsSongs(),
      child:
      SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
              if (state is NewsSongsLoading) {
                return  Center(child: Container(
                  alignment: Alignment.center,
                    child: CircularProgressIndicator()),);
              } else if (state is NewsSongsFailed) {
                return Text(state.message);
              } else if (state is NewsSongsLoaded) {
                return _songs(state.songs);
              } else {
                return Container();
              }
            },
          ))
      ,
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return
      ListView.separated(
        shrinkWrap: true,
        scrollDirection:Axis.horizontal,
          itemBuilder:(context, index) {
return GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder:(context) =>  SongPlayerPage(songEntity: songs[index], index: index,),));
  },
  child: SizedBox(
    width: 160,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              image:DecorationImage(fit: BoxFit.cover,
                image: NetworkImage(AppConstants.songCoverList[index]),
              )
            ),
            child:Align(
              alignment: Alignment.bottomRight,
              child:Container(
                height: 40,
                width: 40,
                transform:Matrix4.translationValues(10, 10, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:context.isDarkOrNot? AppColors.darkGrey:Color(0xffE6E6E6),
                ),
                child: Icon(Icons.play_arrow,color:context.isDarkOrNot? Colors.white: AppColors.darkGrey,size: 30,),
              ) ,
            ),
          ),
        ),
        10.heightBox,
        songs[index].title.text.size(14).align(TextAlign.start).fontWeight(FontWeight.w500).maxLines(2).overflow(TextOverflow.ellipsis).makeCentered(),
      ],
    ),
  ),
);
      }, separatorBuilder:(context, index) {
        return SizedBox(width:14,);
      }, itemCount:songs.length);
  }
}

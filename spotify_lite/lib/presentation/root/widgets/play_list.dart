import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/common/helpers/is_dark_mode.dart';
import 'package:spotify_lite/core/configs/themes/app_colors.dart';
import 'package:spotify_lite/presentation/root/bloc/play_list_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../domian/entities/song/song_entity.dart';
import '../../song_player/pages/song_player_page.dart';
import '../bloc/play_list_state.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if(state is PlayListLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is PlayListFailed){
            return Text(state.message);
          }else if(state is PlayListLoaded){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("PlayList", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text("See more", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color:Color(0xffc6c6c6)),),
                    ],
                  ),
                  _songs(state.songs)
                ],
              ),
            );
          }else{
            return Container();
          }

        },
      )
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemBuilder:(context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) =>  SongPlayerPage(songEntity: songs[index], index: index,),));
        },
        child: ListTile(
          leading:  CircleAvatar(
            backgroundColor:context.isDarkOrNot?AppColors.darkGrey:Colors.grey,
            child:Icon(Icons.play_arrow_rounded),),
          title:songs[index].title.toString().text.fontWeight(FontWeight.bold).make(),
          subtitle: songs[index].artist.toString().text.make(),
          trailing:Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              songs[index].duration.toString().text.size(13).make(),
              30.widthBox,
              const Icon(Icons.favorite,size:30,),
              ]
          ),
        ),
      );
    }, separatorBuilder: (context, index) {
      return const SizedBox(height: 10,);
    }, itemCount: songs.length);
  }
}

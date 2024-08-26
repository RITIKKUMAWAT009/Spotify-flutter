import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/common/helpers/is_dark_mode.dart';
import 'package:spotify_lite/common/widgets/appbar/app_bar.dart';
import 'package:spotify_lite/core/configs/constants/app_constants.dart';
import 'package:spotify_lite/core/configs/themes/app_colors.dart';
import 'package:spotify_lite/domian/entities/song/song_entity.dart';
import 'package:spotify_lite/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  final int index;

  const SongPlayerPage(
      {super.key, required this.songEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          "Now Playing",
          style: TextStyle(fontSize: 18),
        ),
        action: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body: BlocProvider(
        create: (context) {
          print("song url is ====>> ${AppConstants.songList[index]}");
          return SongPlayerCubit()..loadSong(AppConstants.songList[index]);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            children: [
              _songCover(context),
              20.heightBox,
              _songDetails(context),
              30.heightBox,
              _songPlayer(context),

            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(AppConstants.songCoverList[index]),
        ),
      ),
    );
  }

  Widget _songDetails(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10),
      title: Text(
        songEntity.title,
        style: TextStyle(
            color: context.isDarkOrNot ? Colors.white : Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        songEntity.artist,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.favorite_border_rounded,
            size: 40,
            color: context.isDarkOrNot ? AppColors.darkGrey : Colors.grey),
      ),
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SongPlayerLoaded) {
          return Column(children: [
            Slider(
              activeColor: AppColors.primary,
              value: context
                  .read<SongPlayerCubit>()
                  .songPosition
                  .inSeconds
                  .toDouble(),
              min: 0.0,
              max: context
                  .read<SongPlayerCubit>()
                  .songDuration
                  .inSeconds
                  .toDouble(),
              onChanged: (value) {},
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(context.read<SongPlayerCubit>().songPosition)
                ), Text(
                  formatDuration(context.read<SongPlayerCubit>().songDuration)
                )
              ],
            ),
            20.heightBox,
            GestureDetector(
              onTap:(){
                context.read<SongPlayerCubit>().playOrPauseSong();
              },
              child: Container(
                height:60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary
                ),
                child: Icon(
                  size: 40,
                  context.read<SongPlayerCubit>().audioPlayer.playing?Icons.pause:Icons.play_arrow,
                ),
              ),
            )
          ]);
        } else if (state is SongPlayerFailed) {
          return Text(state.message);
        } else {
          return Container();
        }
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes=duration.inMinutes.remainder(60);
    final seconds=duration.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}";
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_lite/common/helpers/is_dark_mode.dart';
import 'package:spotify_lite/common/widgets/appbar/app_bar.dart';
import 'package:spotify_lite/core/configs/assets/app_images.dart';
import 'package:spotify_lite/core/configs/assets/app_vectors.dart';
import 'package:spotify_lite/core/configs/themes/app_colors.dart';
import 'package:spotify_lite/presentation/root/widgets/news_songs.dart';
import 'package:spotify_lite/presentation/root/widgets/play_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBackButton: true,
        title: SvgPicture.asset(
          AppVectors.splash,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeArtistTopCard(context),
            _tabs(),
            SizedBox(
              height:260,
              child: TabBarView(controller: _tabController, children: [
                const NewsSongs(),
                Container(),
                Container(),
                Container(),
              ]),
            ),
            40.heightBox,
            const PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeArtistTopCard(BuildContext context) {
    return Center(
      child: Container(
        height: 188,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  AppVectors.homeArtistTopCard,
                  width: MediaQuery.of(context).size.width - 50,
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Image.asset(AppImages.homeArtist),
                ))
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        indicatorColor: AppColors.primary,
        tabAlignment: TabAlignment.center,
        labelPadding: const EdgeInsets.symmetric(horizontal: 22),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: context.isDarkOrNot ? Colors.white : Colors.black,
        indicatorWeight: 4,
        unselectedLabelColor: context.isDarkOrNot ? Colors.white : Colors.black,
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        tabs: const [
          Text(
            "News",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Videos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Artist",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Podcasts",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ]);
  }
}

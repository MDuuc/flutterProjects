import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/presentation/auth/pages/signin_page.dart';
import 'package:spotify/presentation/home/widgets/news_song.dart';
import 'package:spotify/presentation/home/widgets/play_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController= TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  NewsSong(),
                  Container(),
                  Container(),
                  Container(),
                ]
                ),
            ),
            PlayList(),
            BasicAppButton(
              onPressed: () async {
                await  AuthFirebaseServiceImp().logout();
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SigninPage()
                  )
                );
              },
             title: 'Logoout')
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard(){
    return Center(
      child: Container(
        height: 188,
        child: Stack(
          children: [
            Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppVectors.homeTopCart
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Image.asset(
                AppImages.homeArtist
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _tabs(){
    return TabBar(
      controller: _tabController,
      labelColor: context.IsDarkMode? Colors.white : Colors.black,
      padding: EdgeInsets.symmetric(vertical: 40),
      indicatorColor: AppColors.primary,
      tabs: [
        Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),
        ),
        Text('Video',
            style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),),
        Text('Artist',
            style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),),
        Text('Podcast',
            style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),),

      ]);
  }
}
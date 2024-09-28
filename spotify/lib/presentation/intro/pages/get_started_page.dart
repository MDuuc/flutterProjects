import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AppImages.introBG
              )
              )
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  AppVectors.logo,
                ),
              ),
              Spacer(),
              Text(
                'Enjoy Listining to Music',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 21,),
                Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              BasicAppButton(
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (BuildContext context) =>const ChooseModePage())
                   );
                },
                 title: 'Get Started')
            ],
          ),
        ),
        // Container(
        //   // color: Colors.black.withOpacity(0.15),
        // )
        ],
      ),
    );
  }
}
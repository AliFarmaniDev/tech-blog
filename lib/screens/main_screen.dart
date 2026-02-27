import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.menu, color: Colors.black),
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
        body: Center(
          child: Positioned.fill(
            child: HomeScreen(size: size, bodyMargin: bodyMargin),
          ),
        ),
        // create bottomnavbar
        bottomNavigationBar: Container(
          height: size.height / 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Container(
              height: size.height / 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.bottomNav),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(Assets.icons.home.provider()),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(Assets.icons.write.provider()),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(Assets.icons.user.provider()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

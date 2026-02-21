import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/faje_data.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/widgets/show_podcasts.dart';
import 'package:tech_blog/widgets/show_posts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 16, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.menu),
                    Image(
                      image: Assets.images.logo.provider(),
                      height: size.height / 13.6,
                    ),
                    Icon(Icons.search),
                  ],
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      width: size.width / 1.25,
                      height: size.height / 4.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: Assets.images.posterTest.provider(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width / 1.25,
                      height: size.height / 4.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                          colors: GradientColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homePagePosterMap["writer"] +
                                    " - " +
                                    homePagePosterMap["date"],
                                style: TextStyle(
                                  color: SolidColors.posterTitle,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    homePagePosterMap["like"],
                                    style: TextStyle(
                                      color: SolidColors.posterTitle,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: SolidColors.posterSubTitle,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "دوازده قدم برنامه نویسی یک دوره",
                            style: TextStyle(
                              color: SolidColors.posterSubTitle,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  // tag lists
                  height: 60,
                  child: ListView.builder(
                    itemCount: tagsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // create list builder
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          8,
                          index == 0 ? bodyMargin : 15,
                          8,
                        ),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            gradient: LinearGradient(
                              colors: GradientColors.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              children: [
                                ImageIcon(
                                  Assets.icons.hashtagicon.provider(),
                                  color: Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  tagsList[index].title,
                                  style: TextStyle(
                                    color: SolidColors.hashTag,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32,),
                ShowPosts(),
                const SizedBox(height: 32,),
                //ShowPodcasts()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

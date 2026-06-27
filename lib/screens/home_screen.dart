import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/widgets/post_list.dart';
//import 'package:tech_blog/widgets/show_podcasts.dart';
import 'package:tech_blog/widgets/show_posts.dart';
import 'package:tech_blog/widgets/tags_lists.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
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
                PostLists(),
              ],
            ),
            const SizedBox(height: 16),
            TagsLists(bodyMargin: bodyMargin),
            const SizedBox(height: 32),
            ShowPosts(),
            const SizedBox(height: 32),
            //ShowPodcasts()
          ],
        ),
      ),
    );
  }
}



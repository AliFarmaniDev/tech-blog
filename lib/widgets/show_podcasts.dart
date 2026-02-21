import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/faje_data.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';

class ShowPodcasts extends StatelessWidget {
  const ShowPodcasts({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              ImageIcon(
                Assets.icons.writePodcastIcon.provider(),
                color: SolidColors.colorTitle,
              ),
              const SizedBox(width: 8),
              Text(
                MyStrings.viewHotestPodCasts,
                style: TextStyle(
                  color: SolidColors.colorTitle,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            child: ListView.builder(
              itemCount: podcastsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 16),
                  child: Column(
                    children: [
                      SizedBox(
                        // show podcasts list
                        height: size.height / 6.3,
                        width: size.width / 2.4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: AssetImage(
                                podcastsList[index].podcastImage,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(podcastsList[index].podcastTitle),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';

class ShowPodcasts extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: size.height / 4,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: homeScreenController.topPodcastsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == 0 ? bodyMargin : 16,
                    ),
                    child: Column(
                      children: [
                        // podcast poster
                        SizedBox(
                          height: size.height / 6.3,
                          width: size.width / 2.4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              homeScreenController.topPodcastsList[index].poster!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: Icon(Icons.error),
                                );
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // podcast title
                        SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            homeScreenController.topPodcastsList[index].title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

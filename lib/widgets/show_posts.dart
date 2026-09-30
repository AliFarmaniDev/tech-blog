import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';

class ShowPosts extends StatelessWidget {
  final HomeScreenController homeScreenController = Get.put(
    HomeScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Obx(
        () => Column(
          children: [
            Row(
              children: [
                ImageIcon(
                  Assets.icons.bluePen.provider(),
                  color: SolidColors.seeMore,
                ),
                const SizedBox(width: 8),
                Text(
                  MyStrings.viewHotestBlog,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 53, 53, 53),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            SizedBox(
              height: size.height / 4.1,
              child: homeScreenController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : homeScreenController.errorMessage.value != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(homeScreenController.errorMessage.value!),
                          TextButton(
                            onPressed: homeScreenController.getHomeItems,
                            child: const Text('تلاش دوباره'),
                          ),
                        ],
                      ),
                    )
                  : homeScreenController.topVisitedList.isEmpty
                  ? const Center(
                      child: Text(
                        'هیچ مطلبی وجود ندارد',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: homeScreenController.topVisitedList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final post = homeScreenController.topVisitedList[index];

                        return Padding(
                          padding: EdgeInsets.only(
                            right: index == 0 ? bodyMargin : 15,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height / 6.3,
                                width: size.width / 2.4,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                        image: DecorationImage(
                                          image: post.image != null
                                              ? NetworkImage(post.image!)
                                              : const AssetImage(
                                                      'assets/images/placeholder.png',
                                                    )
                                                    as ImageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      foregroundDecoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: GradientColors.blogPost,
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            post.author ?? 'نویسنده',
                                            style: TextStyle(
                                              color: SolidColors.hashTag,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                post.view ?? '0',
                                                style: TextStyle(
                                                  color: SolidColors.hashTag,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Icon(
                                                Icons.remove_red_eye,
                                                color: SolidColors.hashTag,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width / 2.4,
                                child: Text(
                                  post.title ?? 'بدون عنوان',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 13,
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

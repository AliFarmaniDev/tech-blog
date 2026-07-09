import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/components/my_components.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';
import 'package:tech_blog/screens/home_screen.dart';
import 'package:tech_blog/screens/profile_screen.dart';
import 'package:tech_blog/screens/register_intro_screen.dart';
import 'package:tech_blog/services/dio_service.dart';

class MainScreen extends StatelessWidget {
  // create page index - moved to StatefulWidget for proper state management
  final RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch home items from API
    DioService().getMethod(ApiConstant.getHomeItems);
    // Get the size of the screen and calculate body margin
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        // create drawer
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(Assets.images.logo.path, scale: 3),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "پروفایل کاربری",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    selectedPageIndex.value = 1;
                    Navigator.pop(context); // Close drawer
                  },
                ),
                const Divider(color: SolidColors.dividerColor),

                ListTile(
                  title: const Text(
                    "درباره تک بلاگ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Navigate to about page
                    Navigator.pop(context);
                  },
                ),
                const Divider(color: SolidColors.dividerColor),

                ListTile(
                  title: const Text(
                    "اشتراک گذاری تک بلاگ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    // Share functionality
                    await Share.share(MyStrings.shareText);
                  },
                ),
                const Divider(color: SolidColors.dividerColor),

                ListTile(
                  title: const Text(
                    "تک بلاگ در گیت هاب",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Open GitHub link
                    myLaunchUrl(MyStrings.techBlogGithubUrl);
                  },
                ),
                const Divider(color: SolidColors.dividerColor),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Removed commented out Icon
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Add search functionality
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Obx(
            () => IndexedStack(
              index: selectedPageIndex.value,
              children: [
                HomeScreen(size: size, bodyMargin: bodyMargin),
                ProfileScreen(size: size, bodyMargin: bodyMargin),
                RegisterIntroScreen(),
              ],
            ),
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
            padding: EdgeInsets.only(
              right: bodyMargin,
              left: bodyMargin,
              bottom: 12,
            ),
            child: Container(
              height: size.height / 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.bottomNav),
                borderRadius: const BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      selectedPageIndex.value = 0;
                    },
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      color: SolidColors.hashTag,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      selectedPageIndex.value = 2;
                    },
                    icon: ImageIcon(
                      Assets.icons.write.provider(),
                      color: SolidColors.hashTag,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      selectedPageIndex.value = 1;
                    },
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: SolidColors.hashTag,
                    ),
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

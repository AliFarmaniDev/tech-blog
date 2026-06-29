import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/screens/home_screen.dart';
import 'package:tech_blog/screens/profile_screen.dart';
import 'package:tech_blog/screens/register_intro_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // create page index
  var selectePagedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        // create drawer
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding:  EdgeInsets.only(right:bodyMargin ),
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
              //Icon(Icons.menu, color: Colors.black),
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
            //set pages
            child: IndexedStack(
              // use indexedstack for change pages
              index: selectePagedIndex,
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
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectePagedIndex = 0;
                      });
                    },
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      color: SolidColors.hashTag,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectePagedIndex = 2;
                      });
                    },
                    icon: ImageIcon(
                      Assets.icons.write.provider(),
                      color: SolidColors.hashTag,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectePagedIndex = 1;
                      });
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

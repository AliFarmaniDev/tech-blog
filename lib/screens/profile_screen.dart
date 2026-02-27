import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';
import 'package:tech_blog/widgets/tech_divider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: Assets.images.profileAvatar.provider(), height: 100),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.bluePen.provider(),
                color: SolidColors.seeMore,
              ),
              const SizedBox(width: 8),
              Text(
                MyStrings.imageProfileEdit,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: SolidColors.colorTitle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text(
            "فاطمه امیری",
            style: TextStyle(
              color: SolidColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "fatemeamiri@gmial.com",
            style: TextStyle(
              color: SolidColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          // create a divider widgets
          TechDivider(size: size),
          // create a chilckeble text
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavBlog,
                  style: TextStyle(
                    color: SolidColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          TechDivider(size: size),
          // create a chilckeble text
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavPodcast,
                  style: TextStyle(
                    color: SolidColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          TechDivider(size: size),
          // create a chilckeble text
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.logOut,
                  style: TextStyle(
                    color: SolidColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

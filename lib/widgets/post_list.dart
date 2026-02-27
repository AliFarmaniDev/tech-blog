import 'package:flutter/material.dart';
import 'package:tech_blog/models/faje_data.dart';
import 'package:tech_blog/res/colors.dart';

class PostLists extends StatelessWidget {
  const PostLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}

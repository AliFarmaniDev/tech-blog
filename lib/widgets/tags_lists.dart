import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/faje_data.dart';
import 'package:tech_blog/res/colors.dart';

class TagsLists extends StatelessWidget {
  const TagsLists({super.key, required this.bodyMargin});

  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // tag lists
      height: 60,
      child: ListView.builder(
        itemCount: tagsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // create list builder
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
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
    );
  }
}

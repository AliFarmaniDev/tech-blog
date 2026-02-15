import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/faje_data.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';

class ShowPosts extends StatelessWidget {
  const ShowPosts({super.key});

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
                Assets.icons.bluePen.provider(),
                color: SolidColors.seeMore,
              ),
              const SizedBox(width: 8),
              Text(
                MyStrings.viewHotestBlog,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 53, 53, 53),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // create posts list
          SizedBox(
            height: size.height / 4.1,
            child: ListView.builder(
              itemCount: blogList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index ==0? bodyMargin: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        //sized box for createing posts lists
                        height: size.height / 6.3,
                        width: size.width / 2.4,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(blogList[index].imageUrl),
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
                                    blogList[index].writer,
                                    style: TextStyle(
                                      color: SolidColors.hashTag,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        blogList[index].views,
                                        style: TextStyle(
                                          color: SolidColors.hashTag,
                                        ),
                                      ),
                                      SizedBox(width: 8),
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
                          blogList[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
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
    );
  }
}

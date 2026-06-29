import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/faje_data.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';

class MyCat extends StatefulWidget {
  const MyCat({super.key});

  @override
  State<MyCat> createState() => _MyCatState();
}

class _MyCatState extends State<MyCat> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  SvgPicture.asset(Assets.images.tcbot, height: 100),
                  SizedBox(height: 16),
                  Text(
                    MyStrings.successfulRegistration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: SolidColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: TextStyle(color: SolidColors.dividerColor),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    MyStrings.chooseCats,
                    style: TextStyle(
                      color: SolidColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // create a list of cats whit gridview
                  _showTagList(),
                  const SizedBox(height: 16),
                  Image.asset(Assets.icons.downCatArrow.path, scale: 3),
                  // selected tags list
                  _showSelectedTags(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _showSelectedTags() {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: GridView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: selectedTags.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 0.3,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: SolidColors.surface,
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.fromLTRB(16, 8, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      selectedTags[index].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // remove tag from selected tags list
                    InkWell(
                      onTap: (() {
                        setState(() {
                          selectedTags.removeAt(index);

                        });
                      }),
                      child: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding _showTagList() {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: GridView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: tagsList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 0.3,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              // add tag to selected tags list
              onTap: (() {
                setState(() {
                  if(!selectedTags.contains(tagsList[index])){
                    selectedTags.add(tagsList[index]);
                  } else {
                    // ignore: avoid_print
                    print("item exist");
                  }
                  
                });
              }),
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
      ),
    );
  }
}

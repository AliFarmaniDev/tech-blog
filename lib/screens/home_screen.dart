import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.menu),
                  Image(
                    image: Assets.images.logo.provider(),
                    height: size.height / 13.6,
                  ),
                  Icon(Icons.search),
                ],
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    width: size.width / 1.25,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: Assets.images.posterTest.provider(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.25,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                        colors: GradientColors.homePosterCoverGradiant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("ملیکا عزیزی - سه روز پیش",style: TextStyle(
                              color: SolidColors.posterTitle,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                            ),),
                            Text("253 Like", style: TextStyle(
                              color: SolidColors.posterTitle,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),
                        Text("دوازده قدم برنامه نویسی یک دوره", style: TextStyle(
                          color: SolidColors.posterSubTitle,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

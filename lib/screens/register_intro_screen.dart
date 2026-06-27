import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.tcbot, height: 100),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.welcom,
                  style: TextStyle(
                    color: SolidColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.resolveWith<TextStyle?>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.pressed)) {
                        return TextStyle(fontSize: 20, color: Colors.white);
                      }
                      return TextStyle(fontSize: 25, color: Colors.white);
                    }),
                    backgroundColor: WidgetStateProperty.resolveWith((state) {
                      if (state.contains(WidgetState.pressed)) {
                        return SolidColors.seeMore;
                      }
                      return SolidColors.primaryColor;
                    }),
                  ),
                  child: Text(MyStrings.letsGo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

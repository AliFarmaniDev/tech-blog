import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/res/colors.dart';
import 'package:tech_blog/res/string.dart';
import 'package:tech_blog/screens/my_cat.dart';
import 'package:validators/validators.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  onPressed: () {
                    _showEmailButtomSheet(context, size);
                  },
                  child: Text(MyStrings.letsGo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailButtomSheet(BuildContext context, Size size) {
    // validate email using regex
    // RegExp isEmail = RegExp(
    //   r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    // );
    return showModalBottomSheet(
      // create a buttmSheet
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          // to avoid the keyboard from covering the bottom sheet
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      //validate email
                      onChanged: (value) {
                        // Add email validation logic here
                        // print(value + " is valid email: ${isEmail.hasMatch(value)}");
                        // valdate email usung validators
                        isEmail(value);
                        print(value + "is email: " + isEmail(value).toString());
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "sample@gmail.com",
                        hintStyle: TextStyle(color: SolidColors.dividerColor),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // pop new widget
                      Navigator.pop(context);
                      _activateCodelButtomSheet(context, size);
                    },
                    child: Text("ادامه"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodelButtomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      // create a buttmSheet
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          // to avoid the keyboard from covering the bottom sheet
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      //validate email
                      onChanged: (value) {
                        // Add email validation logic here
                        // print(value + " is valid email: ${isEmail.hasMatch(value)}");
                        // valdate email usung validators
                        isEmail(value);
                        print(value + "is email: " + isEmail(value).toString());
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: TextStyle(color: SolidColors.dividerColor),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // navigate to MyCat screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const MyCat()),
                      );
                    },
                    child: Text("ادامه"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

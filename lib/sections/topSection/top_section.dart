import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'components/logo_blur_box.dart';
import 'components/person_pic.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size*0.7;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 500, minHeight: 400),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
        margin: EdgeInsets.only(top: kDefaultPadding),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            LogoAndBlurBox(size: size),
            Positioned(
              bottom: 0,
              right: 0,
              child: PersonPic(),
            ),
          ],
        ),
      ),
    );
  }
}

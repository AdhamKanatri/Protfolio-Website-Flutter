import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          constraints:
              BoxConstraints(maxWidth: 1110, maxHeight: 200),
          width: double.infinity,
          height: 200,

          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello There!",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white, fontSize: 22),
              ),
              Text(
                "Robbie \nRutherford",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              Text(
                "Creative Design Director",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white, fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}

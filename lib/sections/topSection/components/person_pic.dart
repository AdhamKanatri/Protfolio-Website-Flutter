import 'package:flutter/material.dart';

class PersonPic extends StatelessWidget {
  const PersonPic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wid = 400;
    double width = MediaQuery.of(context).size.width;
    if (width <= 600 && width >= 500) {
      wid = 300;
    }else if (width < 500) {
      wid = 200;
    }else{
      wid = 400;
    }
    return Container(
      constraints: BoxConstraints(
          maxWidth: wid,
          maxHeight: wid,
          //minWidth: MediaQuery.of(context).size.width*0.639,
          //minHeight: MediaQuery.of(context).size.height*0.860
          ),
      child: Image.asset("assets/images/person.png"),
    );
  }
}

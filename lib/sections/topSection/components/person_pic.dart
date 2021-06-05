import 'package:flutter/material.dart';

class PersonPic extends StatelessWidget {
  const PersonPic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wid = 400;
    if (MediaQuery.of(context).size.width < 600) {
      wid = 300;
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

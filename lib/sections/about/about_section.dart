import 'package:flutter/material.dart';
//import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/components/default_button.dart';
import 'package:web_app/components/my_outline_button.dart';
import 'package:web_app/constants.dart';
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';


class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2, horizontal: kDefaultPadding * 0.5),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: AboutTextWithSign()),
              Expanded(
                child: AboutSectionText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Hire Me!",
                press: () {},
              ),
              SizedBox(width: kDefaultPadding * 1),
              MyOutlineButton(
                imageSrc: "assets/images/download.png",
                text: "Download CV",
                press: () => launch("https://drive.google.com/file/d/1hGR7Mnh9hJULj8eEIipc08vvbfA-FgQH/view?usp=sharing")
                    /*Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (_) => Scaffold(
                        appBar: AppBar(
                          title: Text('Adham cv'),
                        ),
                        backgroundColor: Colors.grey,
                        // You can use either PdfViewer.openFile, PdfViewer.openAsset, or PdfViewer.openData
                        body: PdfViewer.openAsset(
                          'assets/pdf/profile.pdf',
                        )
                    )
                  ),
                ),*/
              ),
            ],
          ),
        ],
      ),
    );
  }
}

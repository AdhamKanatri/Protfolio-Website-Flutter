import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/components/default_button.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/socal_card.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: [
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SocalCard(
                  color: Colors.grey[100],
                  iconSrc: "assets/images/github-logo.png",
                  name: 'AdhamKanatri',
                  press: () => launch('https://github.com/AdhamKanatri'),
                ),
                SizedBox(width: MediaQuery.of(context).size.height*0.05,),
                SocalCard(
                  color: Color(0xFFE4FFC7),
                  iconSrc: "assets/images/whatsapp.png",
                  name: '+966 53 858 5448',
                  press: () => launch('https://api.whatsapp.com/send?phone=966538585448'),
                ),
                SizedBox(width: MediaQuery.of(context).size.height*0.05,),
                SocalCard(
                  color: Color(0xFFE8F0F9),
                  iconSrc: "assets/images/messanger.png",
                  name: 'أدهم جمال',
                  press: () => launch('https://www.facebook.com/abmjahed.kanatre'),
                ),
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    String body, name,type,budget,description;
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: wid <= 500 ? 470 : wid*0.36,
            child: TextFormField(
              onChanged: (value) => name = value,
              decoration: InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
            ),
          ),
          SizedBox(
            width: wid <= 500 ? 470 : wid*0.36,
            child: TextFormField(
              onChanged: (value) => budget = value,
              decoration: InputDecoration(
                labelText: "Project Budget",
                hintText: "Select Project Budget",
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: wid <= 500 ? 470 : wid*0.5,
              child: TextFormField(
                onChanged: (value) => type = value,
                decoration: InputDecoration(
                  labelText: "Project Type",
                  hintText: "Select Project Type",
                ),
              ),
            ),
          ),
          SizedBox(
            width: wid <= 500 ? 470 : wid*0.769,
            child: TextFormField(
              onChanged: (value) => description = value,
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Write some description",
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                  imageSrc: "assets/images/contact_icon.png",
                  text: "Contact Me!",
                  press: () {
                    if (name.isNotEmpty && type.isNotEmpty && budget.isNotEmpty && description.isNotEmpty) {
                      body = 'My name is $name \nProject type: $type \nProject budget: $budget \nDescription: $description';
                      launch('mailto:adham890@gmail.com?subject=${Uri.encodeFull(
                          'Project request')}&body=${Uri
                          .encodeFull('$body')}');
                    }
                  },
              ),
            ),
          )
        ],
      ),
    );
  }
}

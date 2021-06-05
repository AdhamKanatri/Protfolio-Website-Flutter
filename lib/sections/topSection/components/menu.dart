import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/sections/about/about_section.dart';
import 'package:web_app/sections/contact/contact_section.dart';
import 'package:web_app/sections/feedback/feedback_section.dart';
import 'package:web_app/sections/recent_work/recent_work_section.dart';
import 'package:web_app/sections/service/service_section.dart';
import 'package:web_app/sections/topSection/top_section.dart';
import '../../../constants.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "Home",
    "About",
    "Services",
    "Portfolio",
    "Feedback",
    "Contact"
  ];
  List<Widget> sortWidget=[
    TopSection(),
    AboutSection(),
    ServiceSection(),
    RecentWorkSection(),
    FeedbackSection(),
    ContactSection(),];
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    double high=MediaQuery.of(context).size.height;
    if(wid < 350 && high < 300 || wid < 450 ){
      return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/Storage Not Enough.png"),
          ),
        ),
      );
    }else{
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              myAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: sortWidget
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
  Widget myAppBar(BuildContext context) =>  SizedBox(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      constraints: BoxConstraints(
        maxHeight: 85,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width*0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          menuItems.length,
              (index) => buildMenuItem(index),
        ),
      ),
    ),
  );

  Widget buildMenuItem(int index) => InkWell(
        onTap: () => insertItem(index),
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width*0.09),
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.02,
                    color: kTextColor),
              ),
              // Hover
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom:
                    selectedIndex != index && hoverIndex == index ? -20 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
              // Select
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -2 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
            ],
          ),
        ),
      );

  void insertItem(int index) {
    setState(() {
      double wid=MediaQuery.of(context).size.width;
      selectedIndex = index;
          if (index == 0) {
            _scrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }  else if (index == 1) {
            _scrollController.animateTo(
              500,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else if(index == 2) {
            _scrollController.animateTo(
              1000,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else if(index == 3) {
            _scrollController.animateTo(
              wid < 1150 ? 1790 : 1830,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else if(index == 4) {
            _scrollController.animateTo(
              wid < 1150 ? 3300 : 2700,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else if(index == 5) {
            _scrollController.animateTo(
              wid < 1150 ? 3900 : 3340,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        });
  }
}